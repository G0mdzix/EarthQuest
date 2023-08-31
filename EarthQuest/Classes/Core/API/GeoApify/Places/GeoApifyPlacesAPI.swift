import Foundation
import EasyNetworkManager
import Combine

// swiftlint:disable all
class GeoApify {

  let sing = EasyNetworkManager.shared

  private var cancellables = Set<AnyCancellable>()

  // 03587a432a28416dbc8ca8a114ac4dc1
  
  let dupa = EasyNetworkManagerRequestModel(
    urlString: "https://api.geoapify.com/v2/places?categories=commercial.supermarket&filter=rect%3A10.716463143326969%2C48.755151258420966%2C10.835314015356737%2C48.680903341613316&limit=20&apiKey=03587a432a28416dbc8ca8a114ac4dc1",
    headers: ["Accept": "application/json"],
    httpMethod: .GET
  )

  func getData() {
    sing.fetchData(dataModel: GeoApifyPlacesFeatureCollection.self, requestModel: dupa)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          print("finished")
        case .failure(let error):
          print(error.description)
        }
      }, receiveValue: { value in
        switch value {
        case .failure(let error):
          print(error)
        case .success(let succes):
          print(succes)
        }
      })
      .store(in: &cancellables)
  }
}
