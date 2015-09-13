import UIKit
import QuartzCore

public class TKGradientView: UIView {
  private let gradientLayer: CAGradientLayer = CAGradientLayer()
  public var colors = [UIColor]() {
    didSet {
      gradientLayer.colors = colors.map({
        return $0.CGColor
      })
    }
  }
  
  public var simulateFullScreenGradient = false {
    didSet {
      setNeedsLayout()
    }
  }
  
  public override var frame: CGRect {
    didSet {
      if simulateFullScreenGradient {
        setNeedsLayout()
      }
    }
  }
  
  public override var center: CGPoint {
    didSet {
      if simulateFullScreenGradient {
        setNeedsLayout()
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layer.addSublayer(gradientLayer)
    clipsToBounds = true
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func layoutSubviews() {
    if simulateFullScreenGradient {
      let frameInWindow = tk_frameInWindow()
      let screenFrame = UIScreen.mainScreen().bounds
      gradientLayer.frame = CGRectMake(-frameInWindow.minX, -frameInWindow.minY, screenFrame.width, screenFrame.height)
    } else {
      gradientLayer.frame = layer.bounds
    }
  }
}