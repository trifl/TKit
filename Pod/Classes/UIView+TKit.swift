import UIKit

public enum TKLayoutOrientation {
    case horizontal, vertical
}

public protocol TKLayoutItem { }

extension UIView: TKLayoutItem { }
extension Double: TKLayoutItem { }

extension Int: TKLayoutItem { }
extension CGFloat: TKLayoutItem { }

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
    public var tk_middle: CGPoint { get { return CGPoint(x: tk_width / 2, y: tk_height / 2) }
        set(middle) {
            center.x += (self.tk_middle.x - middle.x)
            center.y += (self.tk_middle.y - middle.y)
        }
    }
    
    // Heirarchy
    public func tk_bringToFront() -> UIView { superview?.bringSubview(toFront: self); return self }
    public func tk_sendToBack() -> UIView { superview?.sendSubview(toBack: self); return self }
    
    // Frame in other views
    public func tk_frameInWindow() -> CGRect { return tk_frameInView(nil) }
    public func tk_frameInView(_ view: UIView?) -> CGRect { return convert(bounds, to: view) }
    
    public func tk_moveToView(_ view: UIView?) {
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
    public func tk_layout(_ orientation: TKLayoutOrientation, items: [TKLayoutItem]) {
        var delta: CGFloat = 0
        var totalPercentage: CGFloat = 0
        
        // Get total deltas first
        for item in items {
            if let view = item as? UIView {
                switch orientation {
                case .horizontal:
                    delta += view.tk_width
                case .vertical:
                    delta += view.tk_height
                }
            } else if let number = item as? Int {
                delta += CGFloat(number)
            } else if let number = item as? CGFloat {
                delta += number
            } else if let percentage = item as? Double {
                totalPercentage += CGFloat(percentage)
            }
        }
        
        // Leftover delta
        var leftoverDelta: CGFloat!
        if orientation == .horizontal {
            leftoverDelta = tk_width - delta
        } else if orientation == .vertical {
            leftoverDelta = tk_height - delta
        }
        
        let ratio: CGFloat = leftoverDelta / totalPercentage
        
        // Layout the views. O(2n)
        delta = 0
        for item in items {
            if let view = item as? UIView {
                switch orientation {
                case .horizontal:
                    view.tk_left = delta
                    delta = view.tk_right
                case .vertical:
                    view.tk_top = delta
                    delta = view.tk_bottom
                }
            } else if let number = item as? Int {
                delta += CGFloat(number)
            } else if let number = item as? CGFloat {
                delta += number
            } else if let percentage = item as? Double {
                delta += ratio * CGFloat(percentage)
            }
        }
    }
}



