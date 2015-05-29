//
//  UIView+TKit.swift
//  TKit
//
//  Created by JP McGlone on 5/28/15.
//  Copyright (c) 2015 trifl. All rights reserved.
//

import UIKit
import Foundation

public enum TKViewSide {
  case Left, Top, Right, Bottom
}

public extension UIView {
  // TODO: determine if we need to setNeedsLayout or not. If not, do we really even need these extensions?
  // ...decisions.
  public var tk_origin: CGPoint { get { return frame.origin } set(origin) { frame.origin = origin} }
  public var tk_size: CGSize { get { return frame.size } set(size) { frame.size = size} }
  
  public var tk_x: CGFloat { get { return frame.origin.x } set(x) { frame.origin.x = x } }
  public var tk_y: CGFloat { get { return frame.origin.y } set(y) { frame.origin.y = y } }
  public var tk_width: CGFloat { get { return bounds.size.width } set(width) { bounds.size.width = width } }
  public var tk_height: CGFloat { get { return bounds.size.height } set(height) { bounds.size.height = height } }
  
  public var tk_left: CGFloat { get { return tk_x } set(left) { tk_x = left } }
  public var tk_top: CGFloat { get { return tk_y } set(top) { tk_y = top } }
  public var tk_right: CGFloat  { get { return tk_x + tk_width } set(right) { tk_x = right - tk_width } }
  public var tk_bottom: CGFloat { get { return tk_y + tk_height } set(bottom) { tk_y = bottom - tk_height } }
  
  // Similar to center, but in relation to itself
  public var tk_middle: CGPoint { get { return CGPointMake(tk_width.half, tk_height.half) }
    set(middle) {
      center.x += (self.tk_middle.x - middle.x)
      center.y += (self.tk_middle.y - middle.y)
    }
  }
  
  // Snap the view to a side with a given margin
  public func tk_snap(#side: TKViewSide, margin: CGFloat) {
    switch side {
    case .Left:
      tk_left = margin
    case .Top:
      tk_top = margin
    case .Right:
      if let superview = self.superview {
        tk_right = superview.tk_width - margin
      }
    case .Bottom:
      if let superView = self.superview {
        tk_bottom = superview!.tk_height - margin
      }
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
}
