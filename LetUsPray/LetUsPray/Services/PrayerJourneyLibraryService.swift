import Foundation

enum PrayerJourneyLibraryService {
    static func savedIDs() -> Set<String> {
        PrayerStorageCodec.decodeStringSet(UserDefaults.standard.string(forKey: PrayerStorageKeys.savedJourneyIDs) ?? "")
    }

    static func favoriteIDs() -> Set<String> {
        PrayerStorageCodec.decodeStringSet(UserDefaults.standard.string(forKey: PrayerStorageKeys.favoriteJourneyIDs) ?? "")
    }

    static func setSaved(_ isSaved: Bool, journeyID: String) {
        var ids = savedIDs()
        if isSaved { ids.insert(journeyID) } else { ids.remove(journeyID) }
        UserDefaults.standard.set(PrayerStorageCodec.encodeStringSet(ids), forKey: PrayerStorageKeys.savedJourneyIDs)
    }

    static func setFavorite(_ isFavorite: Bool, journeyID: String) {
        var ids = favoriteIDs()
        if isFavorite { ids.insert(journeyID) } else { ids.remove(journeyID) }
        UserDefaults.standard.set(PrayerStorageCodec.encodeStringSet(ids), forKey: PrayerStorageKeys.favoriteJourneyIDs)
    }
}
