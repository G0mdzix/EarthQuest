import Foundation

enum CoreDataServiceBuilder {
  static func build(containerName: CoreDataModels) -> CoreDataService {
    return CoreDataService(containerName: containerName)
  }
}
