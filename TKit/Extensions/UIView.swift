//
//  UIView.swift
//  TKit
//
//  Created by JP McGlone on 6/25/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    public var x: CGFloat { get { return frame.origin.x } set(x) { frame.origin.x = x } }
    public var y: CGFloat { get { return frame.origin.y } set(y) { frame.origin.y = y } }
    public var width: CGFloat { get { return bounds.size.width } set(width) { bounds.size.width = width } }
    public var height: CGFloat { get { return bounds.size.height } set(height) { bounds.size.height = height } }
    
    public var top: CGFloat { get { return y } set(top) { y = top } }
    public var right: CGFloat  { get { return x + width } set(right) { x = right - width } }
    public var bottom: CGFloat { get { return y + height } set(bottom) { y = bottom - height } }
    public var left: CGFloat { get { return x } set(left) { x = left } }
    
    // Similar to center, but in relation to itself
    public var middle: CGPoint { get { return CGPointMake( width.half, height.half ) }
                          set(middle) {
                            center.x += (self.middle.x - middle.x)
                            center.y += (self.middle.y - middle.y)
                          }
    }

    // Simple layout chaining
    public func snapCenterX(x: CGFloat) -> UIView { center.x = x; return self }
    public func snapCenterX() -> UIView { snapCenterX(superview.height.half); return self }
    
    public func snapCenterY(y: CGFloat) -> UIView { center.y = y; return self }
    public func snapCenterY() -> UIView { snapCenterY(superview.height.half); return self }
    
    public func snapCenter(center: CGPoint) -> UIView { self.center = center; return self }
    public func snapCenter() -> UIView { snapCenterX(); snapCenterY(); return self }
    
    public func snapTop(top: CGFloat) -> UIView { self.top = top; return self }
    public func snapTop() -> UIView { snapTop(0); return self }

    public func snapRight(right: CGFloat) -> UIView { left = right; return self }
    public func snapRight() -> UIView { snapLeft(superview.width); return self }
    
    public func snapBottom(bottom: CGFloat) -> UIView { self.bottom = bottom; return self }
    public func snapBottom() -> UIView { snapBottom(superview.height); return self }
    
    public func snapLeft(left: CGFloat) -> UIView { self.left = left; return self }
    public func snapLeft() -> UIView { snapLeft(0); return self }
    
    public func snapFrame(frame: CGRect) -> UIView { self.frame = frame; return self }
    
    // Heirarchy
    public func bringToFront() -> UIView { superview.bringSubviewToFront(self); return self }
    public func sendToBack() -> UIView { superview.sendSubviewToBack(self); return self }
    
    // Frame in other views
    public func frameInWindow() -> CGRect { return frameInView(nil) }
    public func frameInView(view: UIView?) -> CGRect { return convertRect(bounds, toView: view) }
    public func moveToView(view: UIView?) -> UIView {
        var frame = frameInView(view)
        view?.addSubview(self)
        self.frame = frame
        return self
    }
}