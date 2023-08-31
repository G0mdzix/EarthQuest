import Foundation
import UIKit

struct HomeBadgeCellModel {
  let title: String
  let image: UIImage
  let progres: Float

  init(title: String, image: UIImage, progres: Float) {
    self.title = title
    self.image = image
    self.progres = progres
  }
}
