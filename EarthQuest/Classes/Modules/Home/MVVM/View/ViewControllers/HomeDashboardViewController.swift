import UIKit
import EasyUIBuilder
import FirebaseDatabase

class HomeDashboardViewController: UIViewController {

  // MARK: - Private Typealiases

  private typealias Builder = HomeDashboardUIFactory

  // MARK: - Properties

  var presenter: HomeDashboardViewCallBack?

  var modelToDelete: [HomeBadgeCellModel]?

  // MARK: - Subviews

  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let collectionView = Builder.makeCollectionView(
    identifier: Constants.CollectionView.identifier
  )

  // MARK: - Lifecycle

  init(presenter: HomeDashboardViewCallBack? = nil) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError(Constants.Coder.fatalError)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    guard let presenter = presenter else { return }
    presenter.handleViewDidLoad()
    layout()
    configure()

    presenter.makeMockBadgeCellModel()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    guard let presenter = presenter else { return }
    presenter.handleViewWillAppear()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    guard let presenter = presenter else { return }
    presenter.handleViewWillDisappear()
  }
}

// MARK: - HomeDashboardViewDelegate

extension HomeDashboardViewController: HomeDashboardViewDelegate {
  func takeMockModel(model: [HomeBadgeCellModel]) {
    modelToDelete = model
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeDashboardViewController: UICollectionViewDelegateFlowLayout {}

// MARK: - Configure

extension HomeDashboardViewController {
  private func configure() {
    configureBackground()
    configureCollectionView()
    configureScrollView()
    configureContentView()
  }

  private func configureBackground() {
    view.backgroundColor = AppColorMode.currentMode().mainColor
  }

  private func configureCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
  }

  private func configureScrollView() {
    scrollView.delegate = self
    scrollView.isScrollEnabled = true
    scrollView.backgroundColor = .black
    scrollView.contentSize = contentView.frame.size
  }

  private func configureContentView() {
    contentView.sizeToFit()
  }
}

// MARK: - PrivateFunctions

extension HomeDashboardViewController {
  private func dupa() {
    Task {
      guard let data = try? await GeoApifyPlacesAPI.getData() else { return }
      print(data)
    }
  }
}

// MARK: - Layouts

extension HomeDashboardViewController {
  private func layout() {
    addViews()
    collectionViewLayout()
    contentViewLayout()
    scrollViewLayout()
  }

  private func addViews() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    scrollView.addSubview(collectionView)
  }

  private func collectionViewLayout() {
    collectionView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(scrollView.snp.top)
      make.width.equalToSuperview()
      make.height.equalTo(Constants.CollectionView.height)
    }
  }

  private func contentViewLayout() {
    contentView.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.edges.equalToSuperview()
    }
  }

  private func scrollViewLayout() {
    scrollView.snp.makeConstraints { make in
      make.right.left.top.bottom.equalToSuperview()
    }
  }
}
