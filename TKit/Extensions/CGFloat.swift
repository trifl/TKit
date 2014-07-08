//
//  CGFloat.swift
//  TKit
//
//  Created by JP McGlone on 7/7/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import UIKit

extension CGFloat {
    // common 
    var thrice: CGFloat { return self * 3.0 }
    var twice: CGFloat { return self * 2.0 }
    var half: CGFloat { return self * 0.5 }
    var third: CGFloat { return self / 3.0 }
    var fourth: CGFloat { return self * 0.25 }
    var sixth: CGFloat { return self / 6.0 }
    var eighth: CGFloat { return self * 0.125 }
    var twelfth: CGFloat { return self / 12.0 }
    var sixteenth: CGFloat { return self * 0.0625 }
    
    //
    var inverse: CGFloat { return 1.0 / self }
}