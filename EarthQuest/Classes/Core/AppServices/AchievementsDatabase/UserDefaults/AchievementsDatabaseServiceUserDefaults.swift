import Foundation

class AchievementsDatabaseServiceUserDefaults {
}

// MARK: - FirebaseTokenUserDefaultsProtocol

extension AchievementsDatabaseServiceUserDefaults: AchievementsDatabaseServiceUserDefaultsProtocol {
  func isRecordAchievementsPresentInFirebase() -> Bool {
    return UserDefaults.standard.bool(forKey: Keys.recordAchievementsPresentInFirebase)
  }

  func saveRecordAchievementsPresentInFirebase() {
    UserDefaults.standard.set(true, forKey: Keys.recordAchievementsPresentInFirebase)
  }
}

// MARK: - Keys

private enum Keys {
  static let recordAchievementsPresentInFirebase = "recordAchievementsPresentInFirebase"
}
