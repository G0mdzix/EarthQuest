import Foundation

// MARK: - Build

enum AppDelegateDependencyInjection {
  static func build() -> AppDelegateDependency {
    return AppDelegateDependency(
      firebaseTokenServiceProtocol: FirebaseTokenServiceBuilder.build()
    )
  }
}

// MARK: - Services

struct AppDelegateDependency {
  let firebaseTokenServiceProtocol: FirebaseTokenServiceProtocol
}
