import Foundation
import Combine
import FirebaseDatabase

class FirebaseDatabaseService {

  // MARK: - Private Properties

  private var cancellables = Set<AnyCancellable>()
  private let databaseReference = Database.database().reference()
  private let services: Service

  // MARK: - Lifecycle

  init(services: Service) {
    self.services = services
  }
}

// MARK: - FirebaseDatabaseServiceProtocol

extension FirebaseDatabaseService: FirebaseDatabaseServiceProtocol {
  func fetchData<T: Decodable>(dataModel: T.Type) -> AnyPublisher<T, Error> {
    return fetchDataFromFirebase()
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }

  func getUserDatabaseReference(path: String) -> DatabaseReference {
    return databaseReference.child(path)
  }
}

// MARK: - PrivateFunctions

extension FirebaseDatabaseService {
  private func fetchDataFromFirebase() -> AnyPublisher<Data, Error> {
    return Future<Data, Error> { promise in
      self.databaseReference.observeSingleEvent(of: .value) { snapshot in
        guard snapshot.exists(), let value = snapshot.value else {
          return promise(.failure(FirebaseDatabaseErrors.snapshotNotFound))
        }

        promise(Result {
          try JSONSerialization.data(withJSONObject: value)
        })
      }
    }
    .eraseToAnyPublisher()
  }
}

// MARK: - Services

extension FirebaseDatabaseService {
  struct Service {
    let firebaseTokenServiceProtocol: FirebaseTokenServiceProtocol
  }
}
