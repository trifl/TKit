//
//  TKTimer.swift
//  TKit
//
//  Created by JP McGlone on 7/1/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import Foundation

class TKTimer {
    var fps = 60.0
    
    var _timer = NSTimer()
    var _initialDate: NSDate?
    
    var _stopBlock: ((Double) -> Bool)?

    init(fps: Double) {
        self.fps = fps
    }
    
    func fire(function:(time: Double) -> Bool) {
        _invalidate()
        _stopBlock = function
        _initialDate = NSDate()
        _timer = NSTimer.scheduledTimerWithTimeInterval(
            1.0 / fps,
            target: self,
            selector: Selector("_fireStopBlock:"),
            userInfo: nil,
            repeats: true
        )
        // TODO: Something about NSRunLoop?
    }
    
    func _invalidate() {
        _timer.invalidate()
    }
    
    @objc func _fireStopBlock(timer: NSTimer) {
        var stop = false
        if (_stopBlock) {
            var time = NSDate().timeIntervalSinceDate(_initialDate)
            var stop = _stopBlock?(time)
            if(stop!) {
                _invalidate()
            }
        }
    }
    
}