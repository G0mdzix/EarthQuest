import UIKit

class HomeDashboardAssembly {
  func build() -> UIViewController {
    let view = CreateModules.buildViewController()
    let interactor = CreateModules.buildInteractor()
    let router = CreateModules.buildRouter()
    let presenter = CreateModules.buildPresenter(
      view: view,
      interactor: interactor,
      router: router
    )

    view.presenter = presenter
    interactor.presenter = presenter
    router.view = view

    return view
  }
}

private enum CreateModules {
  static func buildViewController() -> HomeDashboardViewController {
    let viewController = HomeDashboardViewController()
    return viewController
  }

  static func buildInteractor() -> HomeDashboardInteractor {
    let interactor = HomeDashboardInteractor()
    return interactor
  }

  static func buildRouter() -> HomeDashboardRouter {
    let router = HomeDashboardRouter()
    return router
  }

  static func buildPresenter(
    view: HomeDashboardViewDelegate,
    interactor: HomeDashboardPresenterCallBack,
    router: HomeDashboardRouterDelegate
  ) -> HomeDashboardPresenter {
    let preseneter = HomeDashboardPresenter(
      view: view,
      interactor: interactor,
      router: router
    )
    return preseneter
  }
}
