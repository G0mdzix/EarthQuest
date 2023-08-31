import Foundation
import CoreData

enum CoreDataServiceObjectBuilder {
  static func createPersistentContainer(_ name: String) -> NSPersistentContainer {
    let container = NSPersistentContainer(name: name)
    container.loadPersistentStores(completionHandler: { storeDescription, error in
      guard let error = error as NSError? else { return }
    })
    return container
  }

  static func createAchievementsEntity(container: NSPersistentContainer) {
    let achievementsEntity = AchievementsEntity(context: container.viewContext)
    achievementsEntity.ski = 0
    achievementsEntity.camping = 0
    achievementsEntity.catering = 0
    achievementsEntity.entertainment = 0
    achievementsEntity.ghost = 0
    achievementsEntity.natural = 0
    achievementsEntity.sport = 0
    achievementsEntity.tourism = 0
  }
}
