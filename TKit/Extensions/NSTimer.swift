//
//  NSTimer.swift
//  TKit
//
//  Created by JP McGlone on 8/8/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import Foundation

// TODO: Consider moving this out or renaming it if it's useful elsewhere
private class Block<T> {
    let f: T
    init (f: T) { self.f = f }
}

public extension NSTimer {
    public class func scheduledTimer(timeInterval: NSTimeInterval, block: ()->(), repeats: Bool) -> NSTimer {
        var b = Block<()->()>(f: block)
        return NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: Selector("block:"), userInfo: b, repeats: repeats)
    }
    
    public class func scheduledTimer(timeInterval: NSTimeInterval, block: ()->()) -> NSTimer {
        return self.scheduledTimer(timeInterval, block: block, repeats: false)
    }
    
    @objc private class func block(timer: NSTimer) {
        if var b = timer.userInfo as? Block<()->()> {
            b.f()
        }
    }
}