//
//  CGFloat.swift
//  TKit
//
//  Created by JP McGlone on 6/25/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import Foundation

extension Double {
    // common 
    var thrice: Double { return self * 3.0 }
    var twice: Double { return self * 2.0 }
    var half: Double { return self * 0.5 }
    var third: Double { return self / 3.0 }
    var fourth: Double { return self * 0.25 }
    var sixth: Double { return self / 6.0 }
    var eighth: Double { return self * 0.125 }
    var twelfth: Double { return self / 12.0 }
    var sixteenth: Double { return self * 0.0625 }
    
    //
    var inverse: Double { return 1.0 / self }
}
