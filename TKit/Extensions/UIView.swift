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

/*
    //Uncomment when compiler is fixed
    var x: CGFloat { get { return frame.origin.x } set(x) { frame.origin.x = x } }
    var y: CGFloat { get { return frame.origin.y } set(y) { frame.origin.y = y } }
    var width: CGFloat { get { return bounds.size.width } set(width) { bounds.size.width = width } }
    var height: CGFloat { get { return bounds.size.height } set(height) { bounds.size.height = height } }
    
    var top: CGFloat { get { return y } set(top) { y = top } }
    var right: CGFloat  { get { return x + width } set(right) { x = right - width } }
    var bottom: CGFloat { get { return y + height } set(bottom) { y = bottom - height } }
    var left: CGFloat { get { return x } set(left) { x = left } }
    
    // Similar to center, but in relation to itself
    var middle: CGPoint { get { return CGPointMake( width.half, height.half ) }
                          set(middle) {
                            center.x += (self.middle.x - middle.x)
                            center.y += (self.middle.y - middle.y)
                          }
    }
*/

    // Frame shortcuts TODO: var
    func x() -> CGFloat { return frame.origin.x }
    func setX(x: CGFloat) { frame.origin.x = x }
    func y() -> CGFloat { return frame.origin.y }
    func setY(y: CGFloat) { frame.origin.y = y }
    func width() -> CGFloat { return frame.size.width }
    func setWidth(width: CGFloat) { frame.size.width = width }
    func height() -> CGFloat { return frame.size.height }
    func setHeight(height: CGFloat) { frame.size.height = height }
    
    // Aliases TODO: var
    func left() -> CGFloat { return x() }
    func setLeft(left: CGFloat) { setX(left) }
    func right() -> CGFloat { return CGRectGetMaxX(frame) }
    func setRight(right: CGFloat) { setX(right - width()) }
    func top() -> CGFloat { return y() }
    func setTop(top: CGFloat) { setY(top) }
    func bottom() -> CGFloat { return CGRectGetMaxY(frame) }
    func setBottom(bottom: CGFloat) { setY(bottom - height()) }

    // Simple layout chaining
    func snapCenterX(x: CGFloat) -> UIView { center.x = x; return self }
    func snapCenterX() -> UIView { snapCenterX(superview.height().half); return self }
    
    func snapCenterY(y: CGFloat) -> UIView { center.y = y; return self }
    func snapCenterY() -> UIView { snapCenterY(superview.height().half); return self }
    
    func snapCenter(center: CGPoint) -> UIView { self.center = center; return self }
    func snapCenter() -> UIView { snapCenterX(); snapCenterY(); return self }
    
    func snapTop(top: CGFloat) -> UIView { setTop(top); return self }
    func snapTop() -> UIView { snapTop(0); return self }

    func snapRight(right: CGFloat) -> UIView { setLeft(right); return self }
    func snapRight() -> UIView { snapLeft(superview.width()); return self }
    
    func snapBottom(bottom: CGFloat) -> UIView { setBottom(bottom); return self }
    func snapBottom() -> UIView { snapBottom(superview.height()); return self }
    
    func snapLeft(left: CGFloat) -> UIView { setLeft(left); return self }
    func snapLeft() -> UIView { snapLeft(0); return self }
    
    func snapFrame(frame: CGRect) -> UIView { self.frame = frame; return self }
    
    // Heirarchy
    func bringToFront() -> UIView { superview.bringSubviewToFront(self); return self }
    func sendToBack() -> UIView { superview.sendSubviewToBack(self); return self }
    
    // Helpers
    func frameInWindow() -> CGRect { return frameInView(nil) }
    func frameInView(view: UIView?) -> CGRect { return convertRect(bounds, toView: view) }
    func moveToView(view: UIView?) -> UIView {
        var frame = frameInView(view)
        view?.addSubview(self)
        self.frame = frame
        return self
    }
    
}