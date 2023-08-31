import Foundation

enum CoreDataErrors: Error {
  case fetchFailed
  case deleteFailed
}

extension CoreDataErrors {
  public var description: String {
    switch self {
    case .fetchFailed:
      return "Fetched failed"
    case .deleteFailed:
      return "Delete failed"
    }
  }
}
