import UIKit

public class TKLayout {
  // MARK: - Init
  public init(frame: CGRect = CGRectZero) { self.frame = frame }
  public init(view: UIView? = nil) {
    self.view = view
    frame = view?.frame ?? frame
    superFrame = view?.superview?.frame ?? CGRectZero
  }
  
  // MARK: - View
  public var view: UIView? { didSet { frame = view?.frame ?? frame; superFrame = view?.superview?.frame ?? CGRectZero } }
  
  // MARK: - Frame
  public var frame = CGRectZero
  public var superFrame: CGRect = CGRectZero
  
  // MARK: - Get
  public var origin: CGPoint { set { frame.origin = newValue } get { return frame.origin } }
  public var size: CGSize { set { frame.size = newValue } get { return frame.size } }
  
  // TODO: - TopLeft, TopRight, BottomLeft, BottomRight
  public var top: CGFloat { set { frame.origin.y = newValue } get { return frame.origin.y } }
  public var left: CGFloat { set { frame.origin.x = newValue } get { return frame.origin.x } }
  public var bottom: CGFloat { set { frame.origin.y = newValue - frame.height } get { return frame.maxY } }
  public var bottomMargin: CGFloat { set { frame.origin.y = superFrame.height - frame.height - newValue } get { return superFrame.height - frame.maxY } }
  public var right: CGFloat { set { frame.origin.x = newValue - frame.width } get { return frame.maxX } }
  public var rightMargin: CGFloat { set { frame.origin.x = superFrame.width - frame.width - newValue } get { return superFrame.width - frame.maxX } }
  
  // MARK: - Set
  public func frame(frame: CGRect) -> TKLayout { self.frame = frame; return self }
  public func top(top: CGFloat) -> TKLayout { self.top = top; return self }
  public func left(left: CGFloat) -> TKLayout { self.left = left; return self }
  public func bottom(bottom: CGFloat) -> TKLayout { self.bottom = bottom; return self }
  public func bottomMargin(bottomMargin: CGFloat) -> TKLayout { self.bottomMargin = bottomMargin; return self }
  public func right(right: CGFloat) -> TKLayout { self.right = right; return self }
  public func rightMargin(rightMargin: CGFloat) -> TKLayout { self.rightMargin = rightMargin; return self }
  public func commit() -> TKLayout { view?.frame = frame; return self }
}
