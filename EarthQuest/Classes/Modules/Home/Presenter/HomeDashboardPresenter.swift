import UIKit

class HomeDashboardPresenter {

  // MARK: - Properties

  weak var view: HomeDashboardViewDelegate?

  // MARK: - Private Properties

  private let interactor: HomeDashboardPresenterCallBack
  private let router: HomeDashboardRouterDelegate

  // MARK: - Lifecycle

  init(
    view: HomeDashboardViewDelegate,
    interactor: HomeDashboardPresenterCallBack,
    router: HomeDashboardRouterDelegate
  ) {
      self.interactor = interactor
      self.router = router
      self.view = view
  }
}

// MARK: - HomeDashboardViewCallBack

extension HomeDashboardPresenter: HomeDashboardViewCallBack {
  func handleViewDidLoad() {
    interactor.performWhenViewDidLoad()
  }

  func handleViewWillAppear() {
    interactor.performWhenViewWillAppear()
  }

  func handleViewWillDisappear() {
    interactor.performWhenViewWillDisappear()
  }
}

// MARK: - HomeDashboardPresenterDelegate

extension HomeDashboardPresenter: HomeDashboardPresenterDelegate {
}

// MARK: - Private Functions

extension HomeDashboardPresenter {
}

// MARK: - Constants

private enum Constants {
}
