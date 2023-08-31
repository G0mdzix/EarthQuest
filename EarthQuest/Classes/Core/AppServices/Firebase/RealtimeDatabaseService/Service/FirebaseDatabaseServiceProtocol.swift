import Foundation
import FirebaseDatabase
import Combine

protocol FirebaseDatabaseServiceProtocol {
  func fetchData<T: Decodable>(dataModel: T.Type) -> AnyPublisher<T, Error>
  func getUserDatabaseReference(path: String) -> DatabaseReference
}
