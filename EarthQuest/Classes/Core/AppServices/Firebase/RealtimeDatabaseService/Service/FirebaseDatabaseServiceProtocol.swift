import Foundation
import Combine

protocol FirebaseDatabaseServiceProtocol {
  func fetchData<T: Decodable>(dataModel: T.Type) -> AnyPublisher<T, Error>
  func initializeUserAchievements()
}
