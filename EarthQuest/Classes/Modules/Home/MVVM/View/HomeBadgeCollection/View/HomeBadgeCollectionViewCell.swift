import UIKit
import EasyUIBuilder

class HomeBadgeCollectionViewCell: UICollectionViewCell {

  // MARK: - Private Typealiases

  private typealias Builder = HomeBadgeCellUIFactory

  // MARK: - Subviews

  let badgeButton = Builder.makeBadgeButton()
  let progressView = Builder.makeProgresView()
  let iconImageView = Builder.makeIconImageView()
  let titleLabel = EasyUIBuilder.Labels.build(model: Builder.titleLabelModel)

  // MARK: - Private Subviews
  private let progresViewContainer = UIView()

  // MARK: - Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLayers()
    layout()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Layouts

extension HomeBadgeCollectionViewCell {
  private func layout() {
    addViews()
    iconImageViewLayout()
    titleLabelLayout()
    badgeButtonLayout()
    progresViewContainerLayout()
    progressViewLayout()
  }

  private func addViews() {
    addSubview(iconImageView)
    addSubview(titleLabel)
    addSubview(badgeButton)
    addSubview(progresViewContainer)
    progresViewContainer.addSubview(progressView)
  }

  private func iconImageViewLayout() {
    iconImageView.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constants.Layout.defualtOffset)
      make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(Constants.Layout.defualtOffset)
      make.size.equalTo(Constants.Layout.defaultSize)
    }
  }

  private func titleLabelLayout() {
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(iconImageView.snp.bottom).offset(Constants.Layout.titleLabelOffset)
      make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(Constants.Layout.defualtOffset)
    }
  }

  private func badgeButtonLayout() {
    badgeButton.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constants.Layout.defualtOffset)
      make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-Constants.Layout.defualtOffset)
      make.size.equalTo(Constants.Layout.defaultSize)
    }
  }

  private func progresViewContainerLayout() {
    progresViewContainer.snp.makeConstraints { make in
      make.left.equalTo(titleLabel)
      make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Layout.defualtOffset)
      make.height.equalTo(Constants.Layout.defualtOffset)
      make.width.equalTo(100)
    }
  }

  private func progressViewLayout() {
    progressView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}

// MARK: - Configure Layers

extension HomeBadgeCollectionViewCell {
  private func configureLayers() {
    configureCellRoundCorners()
    gradientBackgroundColor()
    configureCellShadow()
  }

  private func configureCellShadow() {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = Constants.Shadow.offset
    layer.shadowOpacity = Constants.Shadow.opacity
    layer.shadowRadius = Constants.Shadow.shadowRadius
    layer.masksToBounds = false
    layer.cornerRadius = Constants.Shadow.cornerRadius
    clipsToBounds = false
  }

  private func configureCellRoundCorners() {
    contentView.layer.cornerRadius = Constants.ContentView.cornerRadius
    contentView.layer.masksToBounds = true
    contentView.layer.borderWidth = Constants.ContentView.borderWidth
    contentView.layer.borderColor = UIColor.clear.cgColor
  }

  // MARK: - To Delete !!!
  // swiftlint:disable all
    func cellRandomBackgroundColors() -> [UIColor] {
        //Colors
        let red = [#colorLiteral(red: 0.9654200673, green: 0.1590853035, blue: 0.2688751221, alpha: 1),#colorLiteral(red: 0.7559037805, green: 0.1139892414, blue: 0.1577021778, alpha: 1)]
        let orangeRed = [#colorLiteral(red: 0.9338900447, green: 0.4315618277, blue: 0.2564975619, alpha: 1),#colorLiteral(red: 0.8518816233, green: 0.1738803983, blue: 0.01849062555, alpha: 1)]
        let orange = [#colorLiteral(red: 0.9953531623, green: 0.54947716, blue: 0.1281470656, alpha: 1),#colorLiteral(red: 0.9409626126, green: 0.7209432721, blue: 0.1315650344, alpha: 1)]
        let yellow = [#colorLiteral(red: 0.9409626126, green: 0.7209432721, blue: 0.1315650344, alpha: 1),#colorLiteral(red: 0.8931249976, green: 0.5340107679, blue: 0.08877573162, alpha: 1)]
        let green = [#colorLiteral(red: 0.3796315193, green: 0.7958304286, blue: 0.2592983842, alpha: 1),#colorLiteral(red: 0.2060100436, green: 0.6006633639, blue: 0.09944178909, alpha: 1)]
        let greenBlue = [#colorLiteral(red: 0.2761503458, green: 0.824685812, blue: 0.7065336704, alpha: 1),#colorLiteral(red: 0, green: 0.6422213912, blue: 0.568986237, alpha: 1)]
        let kindaBlue = [#colorLiteral(red: 0.2494148612, green: 0.8105323911, blue: 0.8425348401, alpha: 1),#colorLiteral(red: 0, green: 0.6073564887, blue: 0.7661359906, alpha: 1)]
        let skyBlue = [#colorLiteral(red: 0.3045541644, green: 0.6749247313, blue: 0.9517192245, alpha: 1),#colorLiteral(red: 0.008423916064, green: 0.4699558616, blue: 0.882807076, alpha: 1)]
        let blue = [#colorLiteral(red: 0.1774400771, green: 0.466574192, blue: 0.8732826114, alpha: 1),#colorLiteral(red: 0.00491155684, green: 0.287129879, blue: 0.7411141396, alpha: 1)]
        let bluePurple = [#colorLiteral(red: 0.4613699913, green: 0.3118675947, blue: 0.8906354308, alpha: 1),#colorLiteral(red: 0.3018293083, green: 0.1458326578, blue: 0.7334778905, alpha: 1)]
        let purple = [#colorLiteral(red: 0.7080290914, green: 0.3073516488, blue: 0.8653779626, alpha: 1),#colorLiteral(red: 0.5031493902, green: 0.1100070402, blue: 0.6790940762, alpha: 1)]
        let pink = [#colorLiteral(red: 0.9495453238, green: 0.4185881019, blue: 0.6859942079, alpha: 1),#colorLiteral(red: 0.8123683333, green: 0.1657164991, blue: 0.5003474355, alpha: 1)]

        let colorsTable: [Int: [UIColor]] = [0: red, 1: orangeRed, 2: orange, 3: yellow, 4: green, 5: greenBlue, 6: kindaBlue, 7: skyBlue, 8: blue, 9: bluePurple, 10: bluePurple, 11: purple, 12: pink]

        let randomColors = colorsTable.values.randomElement()
        return randomColors!
    }
    func gradientBackgroundColor() {
      let colors = cellRandomBackgroundColors()
      contentView.setGradientBackgroundColor(colorOne: colors[0], colorTow: colors[1])
    }
}

// MARK: - Constants

private enum Constants {
  enum Layout {
    static let defualtOffset: CGFloat = 8
    static let defaultSize: CGFloat = 36
    static let titleLabelOffset = 18
  }

  enum Shadow {
    static let offset = CGSize(width: 0, height: 1)
    static let opacity: Float = 0.2
    static let shadowRadius: CGFloat = 1.0
    static let cornerRadius: CGFloat = 3
  }

  enum ContentView {
    static let cornerRadius: CGFloat = 12.0
    static let borderWidth: CGFloat = 1.0
  }
}
