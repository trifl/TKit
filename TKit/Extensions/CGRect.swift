//
//  CGRect.swift
//  TKit
//
//  Created by JP McGlone on 8/8/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import Foundation

public func CGRectFromEdgeInsets(rect: CGRect, edgeInsets: UIEdgeInsets) -> CGRect {
    return CGRectMake(
        rect.origin.x + edgeInsets.left,
        rect.origin.y + edgeInsets.top,
        rect.size.width - edgeInsets.left - edgeInsets.right,
        rect.size.height - edgeInsets.top - edgeInsets.bottom);
}

public extension CGRect {
    public func inset(dx: CGFloat, dy:CGFloat) -> CGRect {
        return CGRectInset(self, dx, dy)
    }
}