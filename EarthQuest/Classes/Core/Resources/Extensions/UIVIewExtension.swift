import Foundation
import UIKit

// MARK: - Functions

extension UIView {
  func setGradientBackgroundColor(colorOne: UIColor, colorTow: UIColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [colorOne.cgColor, colorTow.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)

    layer.insertSublayer(gradientLayer, at: 0)
  }
}
