import Foundation

enum FirebaseDatabaseServiceBuilder {
  static func build() -> FirebaseDatabaseService {
    return FirebaseDatabaseService(
      services: .init(firebaseTokenServiceProtocol: FirebaseTokenServiceBuilder.build())
    )
  }
}
