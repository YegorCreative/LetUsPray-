import SwiftUI

struct PsalmsOverviewView: View {
    @Binding var activePlanID: String
    @Binding var completedDayNumbers: Set<Int>
    @Binding var savedVerseIDs: Set<String>
    @Binding var analytics: PrayerAnalyticsSnapshot
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedCollection: PrayerPlan?
    
    private let collections = PsalmsPrayerData.allCollections
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                headerSection
                introductionSection
                collectionsGrid
            }
            .padding(.horizontal, AppSpacing.large)
            .padding(.top, AppSpacing.medium)
            .padding(.bottom, AppSpacing.xxLarge)
        }
        .background(PrayerBackground())
        .navigationTitle("Psalms Journey")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(item: $selectedCollection) { collection in
            PlanDetailView(
                plan: collection,
                isActive: activePlanID == collection.id,
                completedDayNumbers: completedDayNumbersBinding(for: collection),
                savedVerseIDs: $savedVerseIDs,
                analytics: $analytics,
                onStartJourney: {
                    activePlanID = collection.id
                }
            )
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            HStack {
                Image(systemName: "music.note.list")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(AppColors.psalmsAccent)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(collections.count)")
                        .font(AppTypography.title())
                        .foregroundStyle(AppColors.textPrimary)
                    Text("collections")
                        .font(AppTypography.caption())
                        .foregroundStyle(AppColors.textTertiary)
                }
            }
            
            Text("A Journey Through 150 Psalms")
                .font(AppTypography.title2())
                .foregroundStyle(AppColors.textPrimary)
        }
        .padding(.top, AppSpacing.small)
    }
    
    private var introductionSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: AppSpacing.medium) {
                Label("About This Journey", systemImage: "sparkles")
                    .font(AppTypography.headline())
                    .foregroundStyle(AppColors.textPrimary)
                
                Text("The Psalms are prayers, songs, and poems that express the full range of human emotion before God—from joy and thanksgiving to lament and longing.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)
                
                Text("We've organized all 150 Psalms into 10 collections of 15 each. Choose any collection to begin your journey through worship, trust, and honest conversation with God.")
                    .font(AppTypography.body())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineSpacing(4)
            }
        }
    }
    
    private var collectionsGrid: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text("Choose a Collection")
                .font(AppTypography.headline())
                .foregroundStyle(AppColors.textPrimary)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: AppSpacing.medium) {
                ForEach(collections) { collection in
                    CollectionCard(
                        collection: collection,
                        completedCount: completedCount(for: collection),
                        onSelect: {
                            selectedCollection = collection
                        }
                    )
                }
            }
        }
    }
    
    private func completedCount(for collection: PrayerPlan) -> Int {
        analytics.completedDaysByPlan[collection.id] ?? 0
    }
    
    private func completedDayNumbersBinding(for collection: PrayerPlan) -> Binding<Set<Int>> {
        Binding(
            get: {
                // Get the completed days for this specific collection from storage
                let rawValue = UserDefaults.standard.string(forKey: PrayerStorageKeys.completedDaysByPlan) ?? "{}"
                let allCompleted = PrayerStorageCodec.decodeCompletedDaysByPlan(rawValue)
                return allCompleted[collection.id] ?? []
            },
            set: { newValue in
                // Update completed days for this collection in storage
                let rawValue = UserDefaults.standard.string(forKey: PrayerStorageKeys.completedDaysByPlan) ?? "{}"
                var allCompleted = PrayerStorageCodec.decodeCompletedDaysByPlan(rawValue)
                allCompleted[collection.id] = newValue
                UserDefaults.standard.set(PrayerStorageCodec.encodeCompletedDaysByPlan(allCompleted), forKey: PrayerStorageKeys.completedDaysByPlan)
            }
        )
    }
}

struct CollectionCard: View {
    let collection: PrayerPlan
    let completedCount: Int
    let onSelect: () -> Void
    
    private var progressPercentage: Double {
        Double(completedCount) / Double(collection.durationDays)
    }
    
    private var isCompleted: Bool {
        completedCount >= collection.durationDays
    }
    
    var body: some View {
        Button(action: onSelect) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack(alignment: .top) {
                    Image(systemName: collection.coverIcon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(AppColors.psalmsAccent)
                    
                    Spacer()
                    
                    if isCompleted {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(AppColors.premiumGold)
                    }
                }
                
                Text(collection.title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(AppColors.textPrimary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(collection.subtitle)
                    .font(AppTypography.caption())
                    .foregroundStyle(AppColors.textSecondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                // Progress bar
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("\(completedCount)/\(collection.durationDays)")
                            .font(AppTypography.caption())
                            .foregroundStyle(AppColors.textTertiary)
                        
                        Spacer()
                        
                        if completedCount > 0 {
                            Text("\(Int(progressPercentage * 100))%")
                                .font(AppTypography.caption())
                                .foregroundStyle(AppColors.psalmsAccent)
                        }
                    }
                    
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 2, style: .continuous)
                                .fill(AppColors.textTertiary.opacity(0.2))
                                .frame(height: 4)
                            
                            if completedCount > 0 {
                                RoundedRectangle(cornerRadius: 2, style: .continuous)
                                    .fill(AppColors.psalmsAccent)
                                    .frame(width: geometry.size.width * progressPercentage, height: 4)
                            }
                        }
                    }
                    .frame(height: 4)
                }
            }
            .padding(AppSpacing.medium)
            .frame(height: 180)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius, style: .continuous)
                    .stroke(isCompleted ? AppColors.premiumGold.opacity(0.3) : AppColors.glassStroke, lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
        .contentShape(Rectangle())
    }
}

#Preview {
    NavigationStack {
        PsalmsOverviewView(
            activePlanID: .constant("psalms-1-15"),
            completedDayNumbers: .constant([1, 2, 3]),
            savedVerseIDs: .constant([]),
            analytics: .constant(.init(
                completedPrayersCount: 3,
                savedPrayersCount: 0,
                activePlanID: "31-days-in-proverbs",
                completedDaysByPlan: ["psalms-1-15": 3]
            ))
        )
    }
}
