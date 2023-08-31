import Foundation
import Combine
import CoreData

// MARK: - CoreDataServiceServiceProtocol

protocol CoreDataServiceProtocol: AnyObject {
  func saveContext()
  func getContainer() -> NSPersistentContainer
  func delete<T: NSFetchRequestResult>(data: T) -> AnyPublisher<Void, Error>
  func fetch<T: NSFetchRequestResult>(entityName: String) -> AnyPublisher<[T], Error>
}
