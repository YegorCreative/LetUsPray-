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
    @AppStorage(PrayerStorageKeys.savedVerseIDs) private var savedVerseIDsRawValue = ""
    @AppStorage(PrayerStorageKeys.currentStreak) private var currentStreak = 0
    @AppStorage(PrayerStorageKeys.longestStreak) private var longestStreak = 0
    @AppStorage(PrayerStorageKeys.lastCompletedDate) private var lastCompletedDateTimeInterval = 0.0
    @AppStorage(PrayerStorageKeys.completedPrayersCount) private var completedPrayersCount = 0
    @AppStorage(PrayerStorageKeys.savedPrayersCount) private var savedPrayersCount = 0
    @State private var selectedTodayDay: PrayerDay?

    var body: some View {
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

                    SettingsView()
                }
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
        .tint(AppColors.textPrimary)
    }

    private var completedDayNumbersBinding: Binding<Set<Int>> {
        Binding(
            get: { PrayerStorageCodec.decodeIntSet(completedDayNumbersRawValue) },
            set: { completedDayNumbersRawValue = PrayerStorageCodec.encodeIntSet($0) }
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
                    savedPrayersCount: savedPrayersCount
                )
            },
            set: {
                completedPrayersCount = $0.completedPrayersCount
                savedPrayersCount = $0.savedPrayersCount
            }
        )
    }
}

#Preview {
    ContentView()
}
