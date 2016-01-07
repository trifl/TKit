import UIKit

extension UIColor {
  public class func tk_color(hex:Int, alpha: CGFloat = 1.0) -> UIColor {
    let red = CGFloat((hex >> 16) & 0xff) / 255.0
    let green = CGFloat((hex >> 8) & 0xff) / 255.0
    let blue = CGFloat(hex & 0xff) / 255.0
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
}