import Foundation
import Combine

class HomeDashboardInteractor {

  // MARK: - Properties

  weak var presenter: HomeDashboardPresenterDelegate?

  // MARK: - Properties (private)

  private let services: Services
  private var cancellables = Set<AnyCancellable>()

  // MARK: - Lifecycle

  init(services: Services) {
    self.services = services
  }
}

// MARK: - HomeDashboardPresenterCallBack

extension HomeDashboardInteractor: HomeDashboardPresenterCallBack {
  func performWhenViewDidLoad() {
    checkIfDBIsWorking()
    checkIfCoreDataWork()
  }

  func performWhenViewWillAppear() {
  }

  func performWhenViewWillDisappear() {
  }
}

// MARK: - HomeDashboardInteractorDelegate

extension HomeDashboardInteractor: HomeDashboardInteractorDelegate {
}

// MARK: - PrivateFunctions

extension HomeDashboardInteractor {
  private func checkIfDBIsWorking() {
    services.firebaseDatabaseService.fetchData(dataModel: GeoAPIResponse.self)
      .sink(receiveCompletion: { completion in
        guard let error = try? completion.error().localizedDescription else { return }
        print(error)
      }, receiveValue: { response in
        // print(response)
      })
      .store(in: &cancellables)
  }

  private func checkIfCoreDataWork() {
    services.achievementsDatabaseService.getTested()
  }
}

// MARK: - Services

extension HomeDashboardInteractor {
  struct Services {
    let firebaseDatabaseService: FirebaseDatabaseServiceProtocol // to delete
    let coreDataServiceServiceProtocol: CoreDataServiceProtocol // to delete
    let achievementsDatabaseService: AchievementsDatabaseServiceProtocol
  }
}

// MARK: - Constants

private enum Constants {
}
