import Foundation

enum FirebaseDatabaseErrors: Error {
  case snapshotNotFound
}

extension FirebaseDatabaseErrors {
  public var description: String {
    switch self {
    case .snapshotNotFound:
      return "Snapshot not found"
    }
  }
}
