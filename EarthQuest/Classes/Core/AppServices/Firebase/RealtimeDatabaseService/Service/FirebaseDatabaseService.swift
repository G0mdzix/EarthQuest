import Foundation
import Combine
import FirebaseDatabase

class FirebaseDatabaseService {

  // MARK: - Private Properties

  private var cancellables = Set<AnyCancellable>()
  private let databaseReference = Database.database().reference()
}

// MARK: - FirebaseDatabaseServiceProtocol

extension FirebaseDatabaseService: FirebaseDatabaseServiceProtocol {
  func fetchData<T: Decodable>(dataModel: T.Type) -> AnyPublisher<T, Error> {
    return fetchDataFromFirebase()
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }

  func initializeUserAchievements() {
    checkIfRecordExists()
    let newChildReference = getUserDatabaseReference(path: .achievements)
    AchievementsEnum.allCases.forEach {
      newChildReference.child($0.rawValue).setValue(0)
    }
  }
}

// MARK: - PrivateFunctions

extension FirebaseDatabaseService {
  private func fetchDataFromFirebase() -> AnyPublisher<Data, Error> {
    return Future<Data, Error> { promise in
      self.databaseReference.observeSingleEvent(of: .value) { snapshot in
        guard snapshot.exists(), let value = snapshot.value else {
          promise(.failure(FirebaseDatabaseErrors.snapshotNotFound))
          return
        }

        promise(Result {
          try JSONSerialization.data(withJSONObject: value)
        })
      }
    }
    .eraseToAnyPublisher()
  }

  private func getUniqueUserID() -> String {
    guard let id = databaseReference.childByAutoId().key else { return String() }
    return id
  }

  private func getUserDatabaseReference(path: DatabaseReferencePath) -> DatabaseReference {
    return databaseReference
      .child(DatabaseReferencePath.users.rawValue)
      .child(getUniqueUserID())
      .child(path.rawValue)
  }

  private func checkIfRecordExists() {
    getUserDatabaseReference(path: .achievements).observeSingleEvent(of: .value) { value in
      if value.exists() {
        print("balcerek")
      } else {
        print("JUJ")
      }
    }
  }
}
