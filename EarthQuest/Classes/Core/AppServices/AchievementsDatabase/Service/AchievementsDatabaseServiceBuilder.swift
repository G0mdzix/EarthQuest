import Foundation

//swiftlint:disable all
enum AchievementsDatabaseServiceBuilder {
  static func build() -> AchievementsDatabaseService {
    return AchievementsDatabaseService(
      services: .init(
        coreDataService: CoreDataServiceBuilder.build(containerName: .EarthQuest),
        firebaseTokenService: FirebaseTokenServiceBuilder.build(),
        firebaseDatabaseService: FirebaseDatabaseServiceBuilder.build(),
        achievementsDatabaseServiceUserDefaults: AchievementsDatabaseServiceUserDefaults()
      )
    )
  }
}
