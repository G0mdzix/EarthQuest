import FirebaseDatabase
import Foundation
import CoreData
import Combine

class AchievementsDatabaseService {

  // MARK: - Properties (private)

  private let services: Service

  // MARK: - Lifecycle

  init(services: Service) {
    self.services = services
  }
}

// MARK: - AchievementsDatabaseServiceProtocol

extension AchievementsDatabaseService: AchievementsDatabaseServiceProtocol {
  func initializeUserAchievements() {
    let newChildReference = services.firebaseDatabaseService.getUserDatabaseReference(
      path: createReferencePathToUser()
    )
    AchievementsEnum.allCases.forEach {
      newChildReference.child($0.rawValue).setValue(0)
    }
  }
}

// MARK: - PrivateFunctions

extension AchievementsDatabaseService {
  private func createReferencePathToUser() -> String {
    return FirebaseDatabaseReferencePath.combineReferencePaths([
      .users,
      .custom(services.firebaseTokenService.getFCMToken()),
      .achievements
    ])
  }

  private func recordExistsInCoreData() -> AnyPublisher<Bool, Never> {
    return services.coreDataService.fetch(entityName: .EarthQuest)
      .map { (achievements: [AchievementsEntity]) -> Bool in
        !achievements.isEmpty
      }
      .replaceError(with: false)
      .eraseToAnyPublisher()
  }

  private func recordExistsInFirebase() -> AnyPublisher<Bool, Never> {
    return Future<Bool, Never> { promise in
      self.services.firebaseDatabaseService.getUserDatabaseReference(
        path: self.createReferencePathToUser()
      )
      .observeSingleEvent(of: .value) { value in
        guard let _ = value.value as? Bool else {
          return promise(.success(false))
        }
        promise(.success(true))
      }
    }
    .eraseToAnyPublisher()
  }
}

// MARK: - Services

extension AchievementsDatabaseService {
  struct Service {
    let coreDataService: CoreDataServiceProtocol
    let firebaseTokenService: FirebaseTokenServiceProtocol
    let firebaseDatabaseService: FirebaseDatabaseServiceProtocol
  }
}

// MARK: - Constants

private enum Constants {
}

// utworzenie zapisu tu i tu
// sprawdzenie czy istnieje
// aktualizacja tu i tu
// porownanie core data i firebase
// jezeli nie to zaaktualizuj firebase
// aktualizacja istniejacych danych

//  func saveObject() {
//    fetch(entityName: "AchievementsEntity").sink(receiveCompletion: { completion in
//        guard let error = try? completion.error().localizedDescription else { return }
//        print(error)
//      }, receiveValue: { (response: [AchievementsEntity]) in
//        // print(response)
//      })
//      .store(in: &cancellables)
//  }
