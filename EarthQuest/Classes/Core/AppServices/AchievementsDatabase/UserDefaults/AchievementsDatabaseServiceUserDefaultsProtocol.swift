import Foundation

//swiftlint:disable all
protocol AchievementsDatabaseServiceUserDefaultsProtocol {
  func isRecordAchievementsPresentInFirebase() -> Bool
  func saveRecordAchievementsPresentInFirebase()
}
