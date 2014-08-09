//
//  TKit.swift
//  TKit
//
//  Created by JP McGlone on 8/8/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import Foundation

public func callBlock(delay:NSTimeInterval, block: dispatch_block_t) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(time, dispatch_get_main_queue(), block)
}