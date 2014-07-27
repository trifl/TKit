//
//  TKTimer.swift
//  TKit
//
//  Created by JP McGlone on 7/1/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import Foundation

public class TKTimer {
    
    public var fps = 60.0
    
    private var _initialDate: NSDate?
    private var _timer = NSTimer()
    private var _timeFunction: ((Double) -> Bool)?
    private var _duration = 0.0
    private var _usesDuration = false
    
    public init(fps: Double) {
        self.fps = fps
    }
    
    public func fire(function:(time: Double) -> Bool) {
        fire(function, duration: 0)
        _usesDuration = false
    }
    
    public func fire(function:(time: Double) -> Bool, duration: NSTimeInterval) {
        invalidate()
        _timeFunction = function
        _initialDate = NSDate()
        _duration = duration
        _timer = NSTimer.scheduledTimerWithTimeInterval(
            1.0 / fps,
            target: self,
            selector: Selector("_fireTimeFunction"),
            userInfo: nil,
            repeats: true
        )
    }
    
    public func invalidate() {
        _timer.invalidate()
        _duration = 0.0
        _usesDuration = true
        _initialDate = nil;
    }
    
    @objc private func _fireTimeFunction() {
        if var timeFunction = _timeFunction {
            var time = NSDate().timeIntervalSinceDate(_initialDate)
            // This makes sure it always ends at _duration where you are intending it to end, unless
            // explicitly stopped
            if _usesDuration {
                time = min(time, _duration)
            }
            
            var stop = !timeFunction(time)
            if stop || (_usesDuration && time == _duration) {
                invalidate()
            }
        }
    }
}