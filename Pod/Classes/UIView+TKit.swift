import UIKit

public enum TKLayoutOrientation {
  case Horizontal, Vertical
}

public enum TKLayoutItem {
  case Linear(CGFloat), Relative(CGFloat), View(UIView)
}

public extension UIView {
  // Everything from here to tk_height isn't really needed in swift, since view.frame.size.width = x works,
  // but it is a little neater, and this works very well w/ objective-c so it's staying in
  public var tk_origin: CGPoint { get { return frame.origin } set(origin) { frame.origin = origin} }
  public var tk_size: CGSize { get { return frame.size } set(size) { frame.size = size} }
  
  public var tk_x: CGFloat { get { return frame.minX } set(x) { frame.origin.x = x } }
  public var tk_y: CGFloat { get { return frame.minY } set(y) { frame.origin.y = y } }
  public var tk_width: CGFloat { get { return bounds.width } set(width) { bounds.size.width = width } }
  public var tk_height: CGFloat { get { return bounds.height} set(height) { bounds.size.height = height } }
  
  public var tk_left: CGFloat { get { return tk_x } set(left) { tk_x = left } }
  public var tk_top: CGFloat { get { return tk_y } set(top) { tk_y = top } }
  public var tk_right: CGFloat  { get { return frame.maxX } set(right) { tk_x = right - tk_width } }
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
  
  public var tk_bottom: CGFloat { get { return frame.maxY } set(bottom) { tk_y = bottom - tk_height } }
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
  public var tk_middle: CGPoint { get { return CGPointMake(tk_width / 2, tk_height / 2) }
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
    frame = tk_frameInView(view)
  }
  
  // MARK: Layout helpers
  /**
  layout your views horizontally or vertically
  - parameter orienation: the orientation you want to lay out in, .Horizontal or .Vertical
  :items: the array of views and/or floats that represent relative spacing
  
  Example:
  
  - [1, view1, 0.5, view2, 1] will space out view1 and view2 such that the margin of the left and the right are the same, but the space between the views will be half that of the margin
  */
  public func tk_layout(orientation: TKLayoutOrientation, items: [TKLayoutItem]) {
    var delta: CGFloat = 0
    var totalPercentage: CGFloat = 0
    
    // Get total deltas first
    for item in items {
      switch (item) {
      case .View(let view):
        switch orientation {
        case .Horizontal:
          delta += view.tk_width
        case .Vertical:
          delta += view.tk_height
        }
      case .Linear(let number):
        delta += number
      case .Relative(let percentage):
        totalPercentage += percentage
      }
    }
    
    // Leftover delta
    var leftoverDelta: CGFloat!
    if orientation == .Horizontal {
      leftoverDelta = tk_width - delta
    } else if orientation == .Vertical {
      leftoverDelta = tk_height - delta
    }
    
    let ratio: CGFloat = leftoverDelta / totalPercentage
    
    // Layout the views. O(2n)
    delta = 0
    for item in items {
      switch (item) {
      case .View(let view):
        switch orientation {
        case .Horizontal:
          view.tk_left = delta
          delta = view.tk_right
        case .Vertical:
          view.tk_top = delta
          delta = view.tk_bottom
        }
      case .Linear(let number):
        delta += number
      case .Relative(let percentage):
        delta += ratio * percentage
      }
    }
  }
}
