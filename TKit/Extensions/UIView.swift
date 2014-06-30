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
    // TODO: make vars for x,y,width,height,left,right,top,bottom when compiler doesn't break :(
    
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
    func snapCenterY(y: CGFloat) -> UIView { center.y = y; return self }
    func snapCenterY() -> UIView { snapCenterY(superview.height().half); return self }
    
    func snapCenterX(x: CGFloat) -> UIView { center.x = x; return self }
    func snapCenterX() -> UIView { snapCenterX(superview.height().half); return self }
    
    func snapCenter(center: CGPoint) -> UIView { self.center = center; return self }
    func snapCenter() -> UIView { snapCenterX(); snapCenterY(); return self }
    
    func snapLeft(left: CGFloat) -> UIView { setLeft(left); return self }
    func snapLeft() -> UIView { snapLeft(0); return self }

    func snapRight(right: CGFloat) -> UIView { setLeft(right); return self }
    func snapRight() -> UIView { snapLeft(superview.width()); return self }
    
    func snapTop(top: CGFloat) -> UIView { setTop(top); return self }
    func snapTop() -> UIView { snapTop(0); return self }

    func snapBottom(bottom: CGFloat) -> UIView { setBottom(bottom); return self }
    func snapBottom() -> UIView { snapBottom(superview.height()); return self }
    
    func snapFrame(frame: CGRect) -> UIView { self.frame = frame; return self }
    
    // Heirarchy
    func bringToFront() -> UIView { superview.bringSubviewToFront(self); return self }
    func sendToBack() -> UIView { superview.sendSubviewToBack(self); return self }
    
        
}
