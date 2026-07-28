//
//  ContentView.swift
//  LetUsPray
//
//  Created by Yegor Hambaryan on 6/5/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PrayerPlanViewModel()
    @AppStorage(PrayerStorageKeys.completedDayNumbers) private var completedDayNumbersRawValue = ""
    @AppStorage(PrayerStorageKeys.completedDaysByPlan) private var completedDaysByPlanRawValue = "{}"
    @AppStorage(PrayerStorageKeys.savedVerseIDs) private var savedVerseIDsRawValue = ""
    @AppStorage(PrayerStorageKeys.savedPrayerRecords) private var savedPrayerRecordsRawValue = "[]"
    @AppStorage(PrayerStorageKeys.savedPrayerRecordsMigrationCompleted) private var savedPrayerRecordsMigrationCompleted = false
    @AppStorage(PrayerStorageKeys.currentStreak) private var currentStreak = 0
    @AppStorage(PrayerStorageKeys.longestStreak) private var longestStreak = 0
    @AppStorage(PrayerStorageKeys.lastCompletedDate) private var lastCompletedDateTimeInterval = 0.0
    @AppStorage(PrayerStorageKeys.completedPrayersCount) private var completedPrayersCount = 0
    @AppStorage(PrayerStorageKeys.savedPrayersCount) private var savedPrayersCount = 0
    @AppStorage(PrayerStorageKeys.activePlanID) private var activePlanID = ProverbsPrayerData.plan.id
    @AppStorage(PrayerStorageKeys.analyticsActivePlanID) private var analyticsActivePlanID = ProverbsPrayerData.plan.id
    @AppStorage(PrayerStorageKeys.onboardingCompleted) private var hasCompletedOnboarding = false
    @AppStorage(PrayerStorageKeys.latestCompletedPrayerActivity) private var latestCompletedPrayerActivityRawValue = ""
    @AppStorage(PrayerStorageKeys.latestSavedPrayerActivity) private var latestSavedPrayerActivityRawValue = ""
    @AppStorage(PrayerStorageKeys.latestStartedJourneyActivity) private var latestStartedJourneyActivityRawValue = ""
    @AppStorage(PrayerStorageKeys.prayerCompletionDates) private var prayerCompletionDatesRawValue = "[]"
    @State private var selectedTodayDay: PrayerDay?
    @State private var selectedHomePlan: PrayerPlan?
    @State private var selectedTab = 0

    var body: some View {
        Group {
            if hasCompletedOnboarding {
                mainAppExperience
            } else {
                OnboardingView {
                    hasCompletedOnboarding = true
                    syncActivePlan()
                    syncAnalytics()
                }
            }
        }
    }

    private var mainAppExperience: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                TodayView(
                    viewModel: viewModel,
                    completedDayNumbers: completedDayNumbersBinding,
                    savedVerseIDs: savedVerseIDsBinding,
                    prayerStreak: prayerStreakBinding,
                    analytics: analyticsBinding,
                    latestCompletedPrayer: latestCompletedPrayerActivity,
                    latestSavedPrayer: latestSavedPrayerActivity,
                    latestStartedJourney: latestStartedJourneyActivity,
                    prayerCompletionDates: prayerCompletionDates,
                    onOpenDay: { selectedTodayDay = $0 },
                    onStartJourney: startJourney,
                    onOpenPlan: { selectedHomePlan = $0 },
                    onOpenPlans: { selectedTab = 1 },
                    onOpenSaved: { selectedTab = 2 }
                )
                .background(PrayerBackground())
                .navigationDestination(item: $selectedTodayDay) { day in
                    PrayerDetailView(
                        plan: viewModel.activePlan,
                        day: day,
                        completedDayNumbers: completedDayNumbersBinding,
                        savedVerseIDs: savedVerseIDsBinding,
                        analytics: analyticsBinding
                    )
                }
                .navigationDestination(item: $selectedHomePlan) { plan in
                    if plan.id == "psalms-journey-overview" {
                        PsalmsOverviewView(
                            activePlanID: $activePlanID,
                            completedDayNumbers: completedDayNumbersBinding,
                            savedVerseIDs: savedVerseIDsBinding,
                            analytics: analyticsBinding
                        )
                    } else {
                        PlanDetailView(
                            plan: plan,
                            isActive: activePlanID == plan.id,
                            completedDayNumbers: completedDaysBinding(for: plan.id),
                            savedVerseIDs: savedVerseIDsBinding,
                            analytics: analyticsBinding,
                            onStartJourney: { startJourney(plan) }
                        )
                    }
                }
            }
            .tabItem {
                Label("Today", systemImage: "sun.max.fill")
            }
            .tag(0)

            NavigationStack {
                PlansView(
                    viewModel: viewModel,
                    activePlanID: $activePlanID,
                    completedDayNumbers: completedDayNumbersBinding,
                    savedVerseIDs: savedVerseIDsBinding,
                    analytics: analyticsBinding
                )
                .background(PrayerBackground())
            }
            .tabItem {
                Label("Plans", systemImage: "books.vertical.fill")
            }
            .tag(1)

            NavigationStack {
                SavedView(
                    viewModel: viewModel,
                    savedVerseIDs: savedVerseIDsBinding,
                    savedPrayerRecords: savedPrayerRecords,
                    completedDayNumbersForPlan: completedDaysBinding(for:),
                    analytics: analyticsBinding
                )
                .background(PrayerBackground())
            }
            .tabItem {
                Label("Saved", systemImage: "bookmark.fill")
            }
            .tag(2)

            NavigationStack {
                SettingsView {
                    hasCompletedOnboarding = false
                }
                .background(PrayerBackground())
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
            .tag(3)
        }
        .tint(AppColors.textPrimary)
        .onAppear {
            syncActivePlan()
            syncAnalytics()
            migrateSavedPrayerRecordsIfNeeded()
            seedExistingHomeActivityIfNeeded()
        }
        .onChange(of: activePlanID) { oldValue, newValue in
            recordStartedJourneyIfNeeded(oldPlanID: oldValue, newPlanID: newValue)
            syncActivePlan()
            syncAnalytics()
        }
        .onChange(of: completedDaysByPlanRawValue) { oldValue, newValue in
            recordCompletedPrayerIfNeeded(oldValue: oldValue, newValue: newValue)
            syncLegacyCompletedDays()
            syncAnalytics()
        }
        .onChange(of: savedVerseIDsRawValue) { oldValue, newValue in
            synchronizeSavedPrayerRecords(oldValue: oldValue, newValue: newValue)
            recordSavedPrayerIfNeeded(oldValue: oldValue, newValue: newValue)
            syncAnalytics()
        }
    }

    private var completedDayNumbersBinding: Binding<Set<Int>> {
        completedDaysBinding(for: activePlanID)
    }

    private func completedDaysBinding(for planID: String) -> Binding<Set<Int>> {
        Binding(
            get: {
                let map = PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)
                return map[planID] ?? (planID == activePlanID ? legacyCompletedDays : [])
            },
            set: { newValue in
                var map = PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)
                map[planID] = newValue
                completedDaysByPlanRawValue = PrayerStorageCodec.encodeCompletedDaysByPlan(map)
                if planID == activePlanID {
                    completedDayNumbersRawValue = PrayerStorageCodec.encodeIntSet(newValue)
                }
            }
        )
    }

    private var savedVerseIDsBinding: Binding<Set<String>> {
        Binding(
            get: { PrayerStorageCodec.decodeStringSet(savedVerseIDsRawValue) },
            set: { savedVerseIDsRawValue = PrayerStorageCodec.encodeStringSet($0) }
        )
    }

    private var savedPrayerRecords: [SavedPrayerRecord] {
        PrayerStorageCodec.decodeValue([SavedPrayerRecord].self, from: savedPrayerRecordsRawValue) ?? []
    }

    private var prayerStreakBinding: Binding<PrayerStreak> {
        Binding(
            get: {
                PrayerStreak(
                    currentStreak: currentStreak,
                    longestStreak: longestStreak,
                    lastCompletedDate: lastCompletedDateTimeInterval > 0 ? Date(timeIntervalSince1970: lastCompletedDateTimeInterval) : nil
                )
            },
            set: {
                currentStreak = $0.currentStreak
                longestStreak = $0.longestStreak
                lastCompletedDateTimeInterval = $0.lastCompletedDate?.timeIntervalSince1970 ?? 0
            }
        )
    }

    private var analyticsBinding: Binding<PrayerAnalyticsSnapshot> {
        Binding(
            get: {
                PrayerAnalyticsSnapshot(
                    completedPrayersCount: completedPrayersCount,
                    savedPrayersCount: savedPrayersCount,
                    activePlanID: analyticsActivePlanID,
                    completedDaysByPlan: PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue).mapValues(\.count)
                )
            },
            set: {
                completedPrayersCount = $0.completedPrayersCount
                savedPrayersCount = $0.savedPrayersCount
                analyticsActivePlanID = $0.activePlanID
            }
        )
    }

    private var legacyCompletedDays: Set<Int> {
        PrayerStorageCodec.decodeIntSet(completedDayNumbersRawValue)
    }

    private var latestCompletedPrayerActivity: HomePrayerActivity? {
        PrayerStorageCodec.decodeValue(HomePrayerActivity.self, from: latestCompletedPrayerActivityRawValue)
    }

    private var latestSavedPrayerActivity: HomePrayerActivity? {
        PrayerStorageCodec.decodeValue(HomePrayerActivity.self, from: latestSavedPrayerActivityRawValue)
    }

    private var latestStartedJourneyActivity: HomeJourneyActivity? {
        PrayerStorageCodec.decodeValue(HomeJourneyActivity.self, from: latestStartedJourneyActivityRawValue)
    }

    private var prayerCompletionDates: [Date] {
        PrayerStorageCodec.decodeValue([Date].self, from: prayerCompletionDatesRawValue) ?? []
    }

    private func syncActivePlan() {
        let resolvedID = viewModel.planByID(activePlanID)?.id ?? PrayerPlansRepository.featuredPlans.first?.id ?? ProverbsPrayerData.plan.id
        if activePlanID != resolvedID {
            activePlanID = resolvedID
        }
        viewModel.setActivePlan(id: resolvedID)
        syncLegacyCompletedDays()
    }

    private func startJourney(_ plan: PrayerPlan) {
        activePlanID = plan.id
        viewModel.setActivePlan(id: plan.id)
        syncLegacyCompletedDays()
        syncAnalytics()
    }

    private func recordCompletedPrayerIfNeeded(oldValue: String, newValue: String) {
        let oldDays = PrayerStorageCodec.decodeCompletedDaysByPlan(oldValue)
        let newDays = PrayerStorageCodec.decodeCompletedDaysByPlan(newValue)

        for (planID, completedDays) in newDays {
            let addedDays = completedDays.subtracting(oldDays[planID] ?? [])
            guard let dayNumber = addedDays.max(),
                  let plan = viewModel.planByID(planID),
                  let day = viewModel.day(for: dayNumber, in: plan),
                  let verse = day.verses.first(where: { !$0.id.hasSuffix("-closing") }) ?? day.verses.first else {
                continue
            }

            let now = Date()
            latestCompletedPrayerActivityRawValue = PrayerStorageCodec.encodeValue(
                HomePrayerActivity(
                    scriptureReference: verse.reference,
                    journeyName: plan.title,
                    date: now
                )
            )
            appendPrayerCompletionDate(now)
            return
        }
    }

    private func recordSavedPrayerIfNeeded(oldValue: String, newValue: String) {
        let oldIDs = PrayerStorageCodec.decodeStringSet(oldValue)
        let newIDs = PrayerStorageCodec.decodeStringSet(newValue)
        let addedIDs = newIDs.subtracting(oldIDs)

        guard let savedPrayer = viewModel.savedVerses(for: addedIDs).first else { return }

        latestSavedPrayerActivityRawValue = PrayerStorageCodec.encodeValue(
            HomePrayerActivity(
                scriptureReference: savedPrayer.verse.reference,
                journeyName: savedPrayer.plan.title,
                date: Date()
            )
        )
    }

    private func migrateSavedPrayerRecordsIfNeeded() {
        guard !savedPrayerRecordsMigrationCompleted else { return }

        let legacyIDs = PrayerStorageCodec.decodeStringSet(savedVerseIDsRawValue)
        var records = savedPrayerRecords
        let recordedIDs = Set(records.map(\.verseID))
        let migrationDate = Date()

        records.append(contentsOf: legacyIDs.subtracting(recordedIDs).map {
            SavedPrayerRecord(verseID: $0, savedDate: migrationDate)
        })
        records.removeAll { !legacyIDs.contains($0.verseID) }

        let encodedRecords = PrayerStorageCodec.encodeValue(records)
        if savedPrayerRecordsRawValue != encodedRecords {
            savedPrayerRecordsRawValue = encodedRecords
        }
        savedPrayerRecordsMigrationCompleted = true
    }

    private func synchronizeSavedPrayerRecords(oldValue: String, newValue: String) {
        let oldIDs = PrayerStorageCodec.decodeStringSet(oldValue)
        let newIDs = PrayerStorageCodec.decodeStringSet(newValue)
        let addedIDs = newIDs.subtracting(oldIDs)
        let removedIDs = oldIDs.subtracting(newIDs)
        var records = savedPrayerRecords
        let recordedIDs = Set(records.map(\.verseID))
        let savedDate = Date()

        records.append(contentsOf: addedIDs.subtracting(recordedIDs).map {
            SavedPrayerRecord(verseID: $0, savedDate: savedDate)
        })
        records.removeAll { removedIDs.contains($0.verseID) }
        savedPrayerRecordsRawValue = PrayerStorageCodec.encodeValue(records)
        if !savedPrayerRecordsMigrationCompleted {
            savedPrayerRecordsMigrationCompleted = true
        }
    }

    private func recordStartedJourneyIfNeeded(oldPlanID: String, newPlanID: String) {
        guard oldPlanID != newPlanID,
              let plan = viewModel.planByID(newPlanID) else {
            return
        }

        latestStartedJourneyActivityRawValue = PrayerStorageCodec.encodeValue(
            HomeJourneyActivity(journeyName: plan.title, date: Date())
        )
    }

    private func appendPrayerCompletionDate(_ date: Date) {
        let calendar = Calendar.current
        let completionDay = calendar.startOfDay(for: date)
        var dates = prayerCompletionDates

        if !dates.contains(where: { calendar.isDate($0, inSameDayAs: completionDay) }) {
            dates.append(completionDay)
            prayerCompletionDatesRawValue = PrayerStorageCodec.encodeValue(dates.sorted())
        }
    }

    private func seedExistingHomeActivityIfNeeded() {
        if latestStartedJourneyActivity == nil {
            latestStartedJourneyActivityRawValue = PrayerStorageCodec.encodeValue(
                HomeJourneyActivity(journeyName: viewModel.activePlan.title, date: Date())
            )
        }

        guard latestCompletedPrayerActivity == nil,
              let lastCompletedDate = prayerStreakBinding.wrappedValue.lastCompletedDate else {
            return
        }

        appendPrayerCompletionDate(lastCompletedDate)

        let completedDays = completedDayNumbersBinding.wrappedValue
        guard let latestDayNumber = completedDays.max(),
              let day = viewModel.day(for: latestDayNumber),
              let verse = day.verses.first(where: { !$0.id.hasSuffix("-closing") }) ?? day.verses.first else {
            return
        }

        latestCompletedPrayerActivityRawValue = PrayerStorageCodec.encodeValue(
            HomePrayerActivity(
                scriptureReference: verse.reference,
                journeyName: viewModel.activePlan.title,
                date: lastCompletedDate
            )
        )
    }

    private func syncLegacyCompletedDays() {
        let map = PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)
        let activeDays = map[activePlanID] ?? legacyCompletedDays
        completedDayNumbersRawValue = PrayerStorageCodec.encodeIntSet(activeDays)
    }

    private func syncAnalytics() {
        let snapshot = viewModel.analyticsSnapshot(
            completedPrayersByPlan: PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue),
            savedVerseIDs: PrayerStorageCodec.decodeStringSet(savedVerseIDsRawValue),
            activePlanID: activePlanID
        )
        completedPrayersCount = snapshot.completedPrayersCount
        savedPrayersCount = snapshot.savedPrayersCount
        analyticsActivePlanID = snapshot.activePlanID
    }
}

#Preview {
    ContentView()
}
