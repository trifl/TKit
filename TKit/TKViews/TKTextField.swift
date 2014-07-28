//
//  TKTextField.swift
//  TKit
//
//  Created by JP McGlone on 7/27/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import UIKit

public class TKTextField : UITextField {
    public var edgeInsets: UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5) {
    didSet {
        setNeedsLayout()
    }
    }
    
    // TODO: move to CGRect extensions?
    private func rectFromEdgeInsets(rect: CGRect, edgeInsets: UIEdgeInsets) -> CGRect {
        return CGRectMake(
            rect.origin.x + edgeInsets.left,
            rect.origin.y + edgeInsets.top,
            rect.size.width - edgeInsets.left - edgeInsets.right,
            rect.size.height - edgeInsets.top - edgeInsets.bottom);
    }
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        return rectFromEdgeInsets(bounds, edgeInsets: edgeInsets)
    }
    
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        return rectFromEdgeInsets(bounds, edgeInsets: edgeInsets)
    }
}