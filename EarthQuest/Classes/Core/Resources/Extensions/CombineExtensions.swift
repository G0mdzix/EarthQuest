import Foundation
import Combine

// MARK: - Data

extension Subscribers.Completion {
  private enum ErrorFunctionThrowsError: Error {
    case error
  }
}

// MARK: - Functions

extension Subscribers.Completion {
  func error() throws -> Failure {
    if case let .failure(error) = self {
      return error
    }
    throw ErrorFunctionThrowsError.error
  }
}

