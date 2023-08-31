import UIKit
import EasyUIBuilder

// swiftlint:disable all
class HomeDashboardViewController: UIViewController {

  // MARK: - Private Typealiases

  private typealias Builder = HomeDashboardUIFactory

  // MARK: - Properties

  var presenter: HomeDashboardViewCallBack?

  // MARK: - Subviews

  private let scrollView = UIScrollView()

  private var collectionView = Builder.makeCollectionView(identifier: "Cell")

  private let contentView = UIView()

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
    view.backgroundColor = AppColorMode.currentMode().mainColor
    // dupa()

    kupa()
    maupa()
    scrollView.delegate = self
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
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeDashboardViewController: UICollectionViewDelegateFlowLayout {}

// MARK: - UICollectionViewDataSource

extension HomeDashboardViewController: UICollectionViewDataSource {

  fileprivate func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
  }

  //MARK : CollectionView Delegate Methods
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return 2
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "Cell",
      for: indexPath
    ) as! HomeBadgeCollectionViewCell

    cell.editButton.addTarget(self, action: #selector(editCellButton), for: .touchUpInside)
    cell.editButton.tag = indexPath.row
    return cell
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(width: (view.frame.width / 2) - 20, height: 110)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }


  //MARK : - Actions
  @objc func addNewList() {
      print("Add new list")
  }
  @objc func editCellButton() {
      print("Edit")
  }

}


// MARK: - UIScrollViewDelegate

extension HomeDashboardViewController: UIScrollViewDelegate {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    self.tabBarController?.tabBar.isHidden = true
  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    dispatchScrollViewInteractionUpdate()
  }

  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    dispatchScrollViewInteractionUpdate()
  }


  private func dispatchScrollViewInteractionUpdate() {
    DispatchQueue.main.async {
      print("UIScrollView nie jest przewijany.")
      self.tabBarController?.tabBar.isHidden = false
    }
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

  private func kupa() {
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { make in
      make.top.leading.trailing.bottom.equalToSuperview()
    }
    scrollView.isScrollEnabled = true
    scrollView.backgroundColor = .black
  }

  private func maupa() {
    scrollView.addSubview(contentView)

    contentView.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.edges.equalToSuperview()
    }

    contentView.sizeToFit()
    scrollView.contentSize = contentView.frame.size

    setupCollectionView()
    scrollView.addSubview(collectionView)

    collectionView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(scrollView.snp.top)
      make.width.equalToSuperview()
      make.height.equalTo(450)
    }
  }
}

// MARK: - Layouts

extension HomeDashboardViewController {
  private func layout() {
    addViews()
  }

  private func addViews() {
  }
}

// MARK: - Constants

private enum Constants {
  enum Coder {
    static let fatalError = "init(coder:) has not been implemented"
  }
}
