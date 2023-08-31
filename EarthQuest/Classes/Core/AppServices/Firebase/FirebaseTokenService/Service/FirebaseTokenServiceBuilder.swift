import Foundation

enum FirebaseTokenServiceBuilder {
  static func build() -> FirebaseTokenService {
    return FirebaseTokenService(
      services: .init(
        firebaseTokenUserDefaultsProtocol: FirebaseTokenUserDefaults()
      )
    )
  }
}
