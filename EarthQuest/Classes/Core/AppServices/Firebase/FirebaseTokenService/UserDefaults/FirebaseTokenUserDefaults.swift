import Foundation

class FirebaseTokenUserDefaults {
}

// MARK: - FirebaseTokenUserDefaultsProtocol

extension FirebaseTokenUserDefaults: FirebaseTokenUserDefaultsProtocol {
  func saveFCMToken(_ token: String) {
    UserDefaults.standard.set(token, forKey: Keys.firebaseToken)
  }

  func getFCMToken() -> String {
    guard let token = UserDefaults.standard.object(forKey: Keys.firebaseToken) as? String else {
      return String()
    }
    return token
  }

  func isFirebaseTokenPresent() -> Bool {
    return UserDefaults.standard.object(forKey: Keys.firebaseToken) == nil ? false : true
  }
}

// MARK: - Keys

private enum Keys {
  static let firebaseToken = "FirebaseFCMTokenKey"
}
