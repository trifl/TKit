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
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectFromEdgeInsets(bounds, edgeInsets)
    }
    
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectFromEdgeInsets(bounds, edgeInsets)
    }
}