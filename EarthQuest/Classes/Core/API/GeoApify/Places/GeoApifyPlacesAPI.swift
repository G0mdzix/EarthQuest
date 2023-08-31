import Foundation
import EasyNetworkManager
import Combine

// swiftlint:disable all
enum GeoApifyPlacesAPI {

  // MARK: - Properties

  static var cancellables = Set<AnyCancellable>()
  static let manager = EasyNetworkManager.shared

  // MARK: - Fetch data

  static func getData() async throws -> GeoApifyPlacesFeatureCollection {
    return try await withCheckedThrowingContinuation { continuation in
      manager.fetchData(
        dataModel: GeoApifyPlacesFeatureCollection.self,
        requestModel: Request.model
      ).sink(receiveCompletion: { completion in
          switch completion {
          case .finished:
            break
          case .failure(let error):
            continuation.resume(throwing: error)
          }
      }, receiveValue: { value in
        switch value {
        case .failure(let error):
          continuation.resume(throwing: error)
        case .success(let success):
          continuation.resume(returning: success)
        }
      })
      .store(in: &cancellables)
    }
  }
}

// MARK: - Private Request Model

private enum Request {
  static let model = EasyNetworkManagerRequestModel(
    urlString: "https://api.geoapify.com/v2/places?categories=commercial.supermarket&filter=rect%3A10.716463143326969%2C48.755151258420966%2C10.835314015356737%2C48.680903341613316&limit=20&apiKey=03587a432a28416dbc8ca8a114ac4dc1",
    httpMethod: .GET
  )
}
