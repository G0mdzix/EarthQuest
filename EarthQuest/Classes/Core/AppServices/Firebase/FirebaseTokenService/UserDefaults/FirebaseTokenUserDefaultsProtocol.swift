import Foundation

protocol FirebaseTokenUserDefaultsProtocol {
  func saveFCMToken(_ token: String)
  func getFCMToken() -> String
  func isFirebaseTokenPresent() -> Bool 
}
