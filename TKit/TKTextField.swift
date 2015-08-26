import UIKit

public class TKTextField : UITextField {
  public var edgeInsets: UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5) {
    didSet {
      setNeedsLayout()
    }
  }
  override public func textRectForBounds(bounds: CGRect) -> CGRect {
    return CGRectFromEdgeInsets(bounds, edgeInsets: edgeInsets)
  }
  
  override public func editingRectForBounds(bounds: CGRect) -> CGRect {
    return CGRectFromEdgeInsets(bounds, edgeInsets: edgeInsets)
  }
}
