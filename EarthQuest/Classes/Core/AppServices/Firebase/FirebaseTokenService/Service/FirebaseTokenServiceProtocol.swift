import Foundation

protocol FirebaseTokenServiceProtocol {
  func extractFCMToken(_ token: String)
  func getFCMToken() -> String
}
