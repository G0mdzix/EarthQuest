import Foundation

class HomeDashboardInteractor {

  // MARK: - Properties

  weak var presenter: HomeDashboardPresenterDelegate?
}

// MARK: - HomeDashboardPresenterCallBack

extension HomeDashboardInteractor: HomeDashboardPresenterCallBack {
  func performWhenViewDidLoad() {
  }

  func performWhenViewWillAppear() {
  }

  func performWhenViewWillDisappear() {
  }
}

// MARK: - HomeDashboardInteractorDelegate

extension HomeDashboardInteractor: HomeDashboardInteractorDelegate {
}

// MARK: - Constants

private enum Constants {
}
