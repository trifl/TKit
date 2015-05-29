//
//  TKitViewTests.swift
//  TKit
//
//  Created by JP McGlone on 5/28/15.
//  Copyright (c) 2015 trifl. All rights reserved.
//

import Foundation
import XCTest

import TKit

class TKUIViewTests : XCTestCase {  
  func testFrames() {
    let superview = UIView(frame: CGRectMake(0, 0, 1000, 1000))
    let view = UIView(frame: CGRectMake(0, 0, 100, 100))
    superview.addSubview(view)

    view.tk_top = 10
    XCTAssertEqual(view.frame, CGRectMake(0, 10, 100, 100), "frame should be {0, 10, 100, 100}")
    view.tk_left = 11
    XCTAssertEqual(view.frame, CGRectMake(11, 10, 100, 100), "frame should be {11, 10, 100, 100}")
    view.tk_bottom = 12
    XCTAssertEqual(view.frame, CGRectMake(11, -88, 100, 100), "frame should be {11, -88, 100, 100}")
    view.tk_right = 13
    XCTAssertEqual(view.frame, CGRectMake(-87, -88, 100, 100), "frame should be {-87, -88, 100, 100}")
    
    view.tk_snap(side: .Top, margin: 14)
    XCTAssertEqual(view.frame, CGRectMake(-87, 14, 100, 100), "frame should be {-87, 14, 100, 100}")
    view.tk_snap(side: .Left, margin: 15)
    XCTAssertEqual(view.frame, CGRectMake(15, 14, 100, 100), "frame should be {15, 14, 100, 100}")
    view.tk_snap(side: .Bottom, margin: 16)
    XCTAssertEqual(view.frame, CGRectMake(15, 884, 100, 100), "frame should be {15, 884, 100, 100}")
    view.tk_snap(side: .Right, margin: 17)
    XCTAssertEqual(view.frame, CGRectMake(883, 884, 100, 100), "frame should be {883, 884, 100, 100}")   
  }
}
