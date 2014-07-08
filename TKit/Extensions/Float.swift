//
//  CGFloat.swift
//  TKit
//
//  Created by JP McGlone on 7/7/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import Foundation

extension Float {
    // common 
    var thrice: Float { return self * 3.0 }
    var twice: Float { return self * 2.0 }
    var half: Float { return self * 0.5 }
    var third: Float { return self / 3.0 }
    var fourth: Float { return self * 0.25 }
    var sixth: Float { return self / 6.0 }
    var eighth: Float { return self * 0.125 }
    var twelfth: Float { return self / 12.0 }
    var sixteenth: Float { return self * 0.0625 }
    
    //
    var inverse: Float { return 1.0 / self }
}