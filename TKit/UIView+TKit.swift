import UIKit
import Foundation

public enum TKLayoutOrientation {
  case Horizontal, Vertical
}

public extension UIView {
  // Everything from here to tk_height isn't really needed in swift, since view.frame.size.width = x works,
  // but it is a little neater, and this works very well w/ objective-c so it's staying in
  public var tk_origin: CGPoint { get { return frame.origin } set(origin) { frame.origin = origin} }
  public var tk_size: CGSize { get { return frame.size } set(size) { frame.size = size} }

  public var tk_x: CGFloat { get { return frame.origin.x } set(x) { frame.origin.x = x } }
  public var tk_y: CGFloat { get { return frame.origin.y } set(y) { frame.origin.y = y } }
  public var tk_width: CGFloat { get { return bounds.size.width } set(width) { bounds.size.width = width } }
  public var tk_height: CGFloat { get { return bounds.size.height } set(height) { bounds.size.height = height } }
  
  public var tk_left: CGFloat { get { return tk_x } set(left) { tk_x = left } }
  public var tk_top: CGFloat { get { return tk_y } set(top) { tk_y = top } }
  public var tk_right: CGFloat  { get { return tk_x + tk_width } set(right) { tk_x = right - tk_width } }
  public var tk_rightMargin: CGFloat {
    get {
      if let superview = superview {
        return superview.tk_width - tk_right
      } else {
        return 0
      }
    }
    set(margin) {
      if let superview = superview {
        tk_right = superview.tk_width - margin
      }
    }
  }
  
  public var tk_bottom: CGFloat { get { return tk_y + tk_height } set(bottom) { tk_y = bottom - tk_height } }
  public var tk_bottomMargin: CGFloat {
    get {
      if let superview = superview {
        return superview.tk_height - tk_bottom
      } else {
        return 0
      }
    }
    set(margin) {
      if let superview = superview {
        tk_bottom = superview.tk_height - margin
      }
    }
  }
  
  // Similar to center, but in relation to itself
  public var tk_middle: CGPoint { get { return CGPointMake(tk_width.half, tk_height.half) }
    set(middle) {
      center.x += (self.tk_middle.x - middle.x)
      center.y += (self.tk_middle.y - middle.y)
    }
  }
  
  // Heirarchy
  public func tk_bringToFront() -> UIView { superview?.bringSubviewToFront(self); return self }
  public func tk_sendToBack() -> UIView { superview?.sendSubviewToBack(self); return self }
  
  // Frame in other views
  public func tk_frameInWindow() -> CGRect { return tk_frameInView(nil) }
  public func tk_frameInView(view: UIView?) -> CGRect { return convertRect(bounds, toView: view) }
  
  public func tk_moveToView(view: UIView?) {
    view?.addSubview(self)
    self.frame = tk_frameInView(view)
  }
  
  // MARK: Layout helpers
  /**
  layout your views horizontally or vertically
  :param: orienation the orientation you want to lay out in, .Horizontal or .Vertical
  :views: the array of views and/or floats that represent relative spacing 
  
  Example:
  
  - [1, view1, 0.5, view2, 1] will space out view1 and view2 such that the margin of the left and the right are the same, but the space between the views will be half that of the margin
  */
  public func tk_relativeLayout(orientation: TKLayoutOrientation, views: [AnyObject]) {
    var viewTotalD = 0 as CGFloat
    var totalSpacing = 0 as CGFloat
    
    // Get total deltas first
    for obj in views {
      if let view = obj as? UIView {
        if orientation == .Horizontal {
          viewTotalD += view.tk_width
        } else if orientation == .Vertical {
          viewTotalD += view.tk_height
        }
      } else {
        totalSpacing += obj as! CGFloat
      }
    }
    
    // Leftover delta
    var leftoverD: CGFloat!
    if orientation == .Horizontal {
      leftoverD = self.tk_width - viewTotalD
    } else if orientation == .Vertical {
      leftoverD = self.tk_height - viewTotalD
    }
    var ratio = leftoverD / totalSpacing as CGFloat
    
    // Layout the views. O(2n)
    var d = 0 as CGFloat
    for obj in views {
      if let view = obj as? UIView {
        if orientation == .Horizontal {
          view.tk_left = d
          d = view.tk_right
        } else if orientation == .Vertical {
          view.tk_top = d
          d = view.tk_bottom
        }
      } else {
        d += ratio * (obj as! CGFloat)
      }
    }
  }
  
  public func tk_linearLayout(orientation: TKLayoutOrientation, views: [AnyObject]) {
    var d = 0 as CGFloat
    for obj in views {
      if let view = obj as? UIView {
        if orientation == .Horizontal {
          view.tk_left = d
          d = view.tk_right
        } else if orientation == .Vertical {
          view.tk_top = d
          d = view.tk_bottom
        }
      } else {
        d += obj as! CGFloat
      }
    }
  }
}
