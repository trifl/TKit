//
//  CGFloat.swift
//  TKit
//
//  Created by JP McGlone on 7/7/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import Foundation

public extension CGFloat {
    // common 
    public var thrice: CGFloat { return self * 3.0 }
    public var twice: CGFloat { return self * 2.0 }
    public var half: CGFloat { return self * 0.5 }
    public var third: CGFloat { return self / 3.0 }
    public var fourth: CGFloat { return self * 0.25 }
    public var sixth: CGFloat { return self / 6.0 }
    public var eighth: CGFloat { return self * 0.125 }
    public var twelfth: CGFloat { return self / 12.0 }
    public var sixteenth: CGFloat { return self * 0.0625 }
    
    //
    public var inverse: CGFloat { return 1.0 / self }
}