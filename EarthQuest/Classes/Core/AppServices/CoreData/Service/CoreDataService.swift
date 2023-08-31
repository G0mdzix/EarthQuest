import Foundation
import CoreData
import Combine

class CoreDataService {

  // MARK: - Private Typealiases

  private typealias ObjectBuilder = CoreDataServiceObjectBuilder

  // MARK: - Properties (private)

  private var cancellables = Set<AnyCancellable>()
  private let container: NSPersistentContainer

  // MARK: - Lifecycle

  init(containerName: CoreDataModels) {
    self.container = ObjectBuilder.createPersistentContainer(containerName.rawValue)
  }
}

// MARK: - CoreDataServiceProtocol

extension CoreDataService: CoreDataServiceProtocol {
  func saveContext() {
    guard container.viewContext.hasChanges else { return }
    guard (try? container.viewContext.save()) != nil else { return }
  }

  func fetch<T: NSFetchRequestResult>(entityName: String) -> AnyPublisher<[T], Error> {
    Future<[T], Error> { promise in
      let request = NSFetchRequest<T>(entityName: entityName)
      guard let entities = try? self.container.viewContext.fetch(request) else {
        return promise(.failure(CoreDataErrors.fetchFailed))
      }
      promise(.success(entities))
    }
    .eraseToAnyPublisher()
  }

  func delete<T: NSFetchRequestResult>(data: T) -> AnyPublisher<Void, Error> {
    Future<Void, Error> { promise in
      guard let data = data as? NSManagedObject else { return }
      self.container.viewContext.delete(data)
      guard let save = try? self.saveContext() else {
        return promise(.failure(CoreDataErrors.deleteFailed))
      }
      promise(.success(save))
    }
    .eraseToAnyPublisher()
  }
}
