import Foundation
import FirebaseMessaging

class FirebaseTokenService {

  // MARK: - Properties (private)

  private let services: Service

  // MARK: - Lifecycle

  init(services: Service) {
    self.services = services
  }
}

// MARK: - FirebaseTokenServiceProtocol

extension FirebaseTokenService: FirebaseTokenServiceProtocol {
  func extractFCMToken(_ token: String) {
    handleFirebaseTokenIfNeeded(token: token)
  }

  func getFCMToken() -> String {
    return services.firebaseTokenUserDefaultsProtocol.getFCMToken()
  }
}

// MARK: - PrivateFunctions

extension FirebaseTokenService {
  private func handleFirebaseTokenIfNeeded(token: String) {
    guard !services.firebaseTokenUserDefaultsProtocol.isFirebaseTokenPresent() else { return }
    services.firebaseTokenUserDefaultsProtocol.saveFCMToken(token)
  }
}

// MARK: - Services

extension FirebaseTokenService {
  struct Service {
    let firebaseTokenUserDefaultsProtocol: FirebaseTokenUserDefaultsProtocol
  }
}
