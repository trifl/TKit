import UIKit

extension UIColor {
  public class func tk_color(hex:Int, alpha: CGFloat = 0.0) -> UIColor {
    let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
    let blue = CGFloat((hex & 0xFF)) / 255.0
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
}