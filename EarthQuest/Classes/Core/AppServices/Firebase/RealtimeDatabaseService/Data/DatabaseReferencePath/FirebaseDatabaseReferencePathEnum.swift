import Foundation

enum FirebaseDatabaseReferencePath {
  case users
  case achievements
  case custom(String)

  func rawValue() -> String {
    switch self {
      case .users:
        return "Users/"
      case .achievements:
        return "Achievements/"
      case .custom(let customValue):
        return customValue
    }
  }

  static func combineReferencePaths(_ paths: [FirebaseDatabaseReferencePath]) -> String {
    let combinedPath = paths.map { $0.rawValue() }.joined()
    return combinedPath
  }
}

