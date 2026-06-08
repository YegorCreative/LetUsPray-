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
    @AppStorage(PrayerStorageKeys.currentStreak) private var currentStreak = 0
    @AppStorage(PrayerStorageKeys.longestStreak) private var longestStreak = 0
    @AppStorage(PrayerStorageKeys.lastCompletedDate) private var lastCompletedDateTimeInterval = 0.0
    @AppStorage(PrayerStorageKeys.completedPrayersCount) private var completedPrayersCount = 0
    @AppStorage(PrayerStorageKeys.savedPrayersCount) private var savedPrayersCount = 0
    @AppStorage(PrayerStorageKeys.activePlanID) private var activePlanID = ProverbsPrayerData.plan.id
    @AppStorage(PrayerStorageKeys.analyticsActivePlanID) private var analyticsActivePlanID = ProverbsPrayerData.plan.id
    @AppStorage(PrayerStorageKeys.onboardingCompleted) private var hasCompletedOnboarding = false
    @State private var selectedTodayDay: PrayerDay?

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
        TabView {
            NavigationStack {
                ZStack {
                    PrayerBackground()

                    TodayView(
                        viewModel: viewModel,
                        completedDayNumbers: completedDayNumbersBinding,
                        savedVerseIDs: savedVerseIDsBinding,
                        prayerStreak: prayerStreakBinding,
                        analytics: analyticsBinding,
                        onOpenDay: { selectedTodayDay = $0 }
                    )
                }
                .navigationDestination(item: $selectedTodayDay) { day in
                    PrayerDetailView(
                        plan: viewModel.activePlan,
                        day: day,
                        savedVerseIDs: savedVerseIDsBinding,
                        analytics: analyticsBinding
                    )
                }
            }
            .tabItem {
                Label("Today", systemImage: "sun.max.fill")
            }

            NavigationStack {
                ZStack {
                    PrayerBackground()

                    PlansView(
                        viewModel: viewModel,
                        activePlanID: $activePlanID,
                        completedDayNumbers: completedDayNumbersBinding,
                        savedVerseIDs: savedVerseIDsBinding,
                        analytics: analyticsBinding
                    )
                }
            }
            .tabItem {
                Label("Plans", systemImage: "books.vertical.fill")
            }

            NavigationStack {
                ZStack {
                    PrayerBackground()

                    SavedView(
                        viewModel: viewModel,
                        savedVerseIDs: savedVerseIDsBinding,
                        analytics: analyticsBinding
                    )
                }
            }
            .tabItem {
                Label("Saved", systemImage: "bookmark.fill")
            }

            NavigationStack {
                ZStack {
                    PrayerBackground()

                    SettingsView {
                        hasCompletedOnboarding = false
                    }
                }
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
        .tint(AppColors.textPrimary)
        .onAppear {
            syncActivePlan()
            syncAnalytics()
        }
        .onChange(of: activePlanID) { _, _ in
            syncActivePlan()
            syncAnalytics()
        }
        .onChange(of: completedDaysByPlanRawValue) { _, _ in
            syncLegacyCompletedDays()
            syncAnalytics()
        }
        .onChange(of: savedVerseIDsRawValue) { _, _ in
            syncAnalytics()
        }
    }

    private var completedDayNumbersBinding: Binding<Set<Int>> {
        Binding(
            get: {
                let map = PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)
                return map[activePlanID] ?? legacyCompletedDays
            },
            set: { newValue in
                var map = PrayerStorageCodec.decodeCompletedDaysByPlan(completedDaysByPlanRawValue)
                map[activePlanID] = newValue
                completedDaysByPlanRawValue = PrayerStorageCodec.encodeCompletedDaysByPlan(map)
                completedDayNumbersRawValue = PrayerStorageCodec.encodeIntSet(newValue)
            }
        )
    }

    private var savedVerseIDsBinding: Binding<Set<String>> {
        Binding(
            get: { PrayerStorageCodec.decodeStringSet(savedVerseIDsRawValue) },
            set: { savedVerseIDsRawValue = PrayerStorageCodec.encodeStringSet($0) }
        )
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

    private func syncActivePlan() {
        let resolvedID = viewModel.planByID(activePlanID)?.id ?? PrayerPlansRepository.featuredPlans.first?.id ?? ProverbsPrayerData.plan.id
        if activePlanID != resolvedID {
            activePlanID = resolvedID
        }
        viewModel.setActivePlan(id: resolvedID)
        syncLegacyCompletedDays()
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
