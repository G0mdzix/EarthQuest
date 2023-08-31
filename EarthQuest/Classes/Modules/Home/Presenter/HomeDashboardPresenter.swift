import UIKit
import EasyUIBuilder

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

  // swiftlint:disable all
  func makeMockBadgeCellModel() {
    var kupa: [HomeBadgeCellModel] = []
    kupa
      .append(HomeBadgeCellModel(title: "Catering", image: EasyUIAssets.Images.homeFill.image, progres: 0.75))
    kupa
      .append(HomeBadgeCellModel(title: "Entertainment", image: EasyUIAssets.Images.homeHollow.image, progres: 0.5))
    kupa
      .append(HomeBadgeCellModel(title: "Natural", image: EasyUIAssets.Images.mapFill.image, progres: 0.1))
    kupa
      .append(HomeBadgeCellModel(title: "Tourism", image: EasyUIAssets.Images.mapHollow.image, progres: 0.2))
    kupa
      .append(HomeBadgeCellModel(title: "Camping", image: EasyUIAssets.Images.userFill.image, progres: 0.7))
    kupa
      .append(HomeBadgeCellModel(title: "Ski", image: EasyUIAssets.Images.userHollow.image, progres: 0.5))
    kupa
      .append(HomeBadgeCellModel(title: "Sport", image: EasyUIAssets.Images.mapFill.image, progres: 0.4))
    kupa
      .append(HomeBadgeCellModel(title: "Ghost", image: EasyUIAssets.Images.homeFill.image, progres: 0.9))
    view?.takeMockModel(model: kupa)
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
