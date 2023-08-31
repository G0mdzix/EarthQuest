import FirebaseDatabase
import Foundation
import CoreData
import Combine

class AchievementsDatabaseService {

  // MARK: - Properties (private)

  private var cancellables = Set<AnyCancellable>()
  private let services: Service

  // MARK: - Lifecycle

  init(services: Service) {
    self.services = services
  }
}

// MARK: - AchievementsDatabaseServiceProtocol

extension AchievementsDatabaseService: AchievementsDatabaseServiceProtocol {
  func getTested() {
    ddd()
    saveObject2()
    services.coreDataService.delete(data: AchievementsEntity())
    checkAchievementsInFirebase()
    handleCoreDataRecordExistence()
  }

  func checkAchievementsInFirebase() {
    switch services
      .achievementsDatabaseServiceUserDefaults
      .isRecordAchievementsPresentInFirebase() {
    case true:
      break
    case false:
      handleFirebaseRecordExistence()
    }
  }
}

// MARK: - PrivateFunctions in Firebase

extension AchievementsDatabaseService {
  private func createReferencePathToUser() -> String {
    return FirebaseDatabaseReferencePath.combineReferencePaths([
      .users,
      .custom(services.firebaseTokenService.getFCMToken() + "/"),
      .achievements
    ])
  }

  private func recordExistsInFirebase() -> AnyPublisher<Bool, Never> {
    return Future<Bool, Never> { promise in
      self.services.firebaseDatabaseService.getUserDatabaseReference(
        path: self.createReferencePathToUser()
      )
      .observeSingleEvent(of: .value) { value in
        guard value.exists() == true else {
          return promise(.success(false))
        }
        promise(.success(true))
      }
    }
    .eraseToAnyPublisher()
  }

  private func initializeRecordInFirebase() {
    AchievementsEnum.allCases.forEach {
      services.firebaseDatabaseService.getUserDatabaseReference(
        path: createReferencePathToUser()
      )
      .child($0.rawValue).setValue(0)
    }
  }

  private func handleFirebaseRecordExistence() {
    recordExistsInFirebase().receive(on: DispatchQueue.global(qos: .background)).sink(
      receiveValue: { [self] value in
        switch value {
        case false:
          initializeRecordInFirebase()
          services.achievementsDatabaseServiceUserDefaults.saveRecordAchievementsPresentInFirebase()
        case true:
          break
        }
      }
    )
    .store(in: &cancellables)
  }
}

// MARK: - PrivateFunctions in CoreData

extension AchievementsDatabaseService {
  private func recordExistsInCoreData() -> AnyPublisher<Bool, Never> {
    return services.coreDataService.fetch(entityName: "AchievementsEntity")
      .map { (achievements: [AchievementsEntity]) -> Bool in
        !achievements.isEmpty
      }
      .replaceError(with: false)
      .eraseToAnyPublisher()
  }

  private func handleCoreDataRecordExistence() {
    recordExistsInCoreData().receive(on: DispatchQueue.global(qos: .background)).sink(
      receiveValue: { [self] value in
        switch value {
        case false:
          print("Nei isteniej ")
        case true:
          print("Isteniej ", value)
        }
      }
    )
    .store(in: &cancellables)
  }

    private func saveObject2() {
      services.coreDataService.fetch(entityName: "AchievementsEntity").sink(receiveCompletion: { completion in
          guard let error = try? completion.error().localizedDescription else { return }
        }, receiveValue: { (response: [AchievementsEntity]) in
          print(response.isEmpty, "gugu")
        })
        .store(in: &cancellables)
    }

  private func ddd() {
    let achievementsEntity = AchievementsEntity(context: services.coreDataService.getContainer().viewContext)
    achievementsEntity.ski = 0
    achievementsEntity.camping = 0
    achievementsEntity.catering = 0
    achievementsEntity.entertainment = 0
    achievementsEntity.ghost = 0
    achievementsEntity.natural = 0
    achievementsEntity.sport = 0
    achievementsEntity.tourism = 0
    services.coreDataService.saveContext()
  }
}

// MARK: - Services

extension AchievementsDatabaseService {
  struct Service {
    let coreDataService: CoreDataServiceProtocol
    let firebaseTokenService: FirebaseTokenServiceProtocol
    let firebaseDatabaseService: FirebaseDatabaseServiceProtocol
    let achievementsDatabaseServiceUserDefaults: AchievementsDatabaseServiceUserDefaultsProtocol
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

//private func saveObject2() -> Future<Bool, Error> {
//    return Future<Bool, Error> { promise in
//        services.coreDataService.fetch(entityName: "AchievementsEntity")
//            .sink(receiveCompletion: { completion in
//                if case .failure(let error) = completion {
//                    promise(.failure(error))
//                }
//            }, receiveValue: { (response: [AchievementsEntity]) in
//                let isEmpty = response.isEmpty
//                print(isEmpty, "gugu")
//                promise(.success(isEmpty))
//            })
//            .store(in: &cancellables)
//    }
//}
