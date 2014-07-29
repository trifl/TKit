//
//  TKTimerViewController.swift
//  TKit
//
//  Created by JP McGlone on 7/25/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import UIKit
import TKit

class TKTimerViewController: UIViewController {
    var timer = TKTimer(fps: 30.0)
    var start = 100.0
    
    var fpsTextField = TKTextField()
    var durationTextField = TKTextField()
    
    var counterLabel = UILabel()
    var goButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    
    var tapGestureRecognizer: UITapGestureRecognizer?
    
    // MARK: -
    // MARK: view stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "TKTimer"
        setupTapGestureRecognizer()

        setupFpsTextField()
        setupDurationTextField()
        
        setupCounterLabel()
        
        setupGoButton()
        
        var t = UITextField()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        counterLabel.sizeToFit()
        counterLabel.center = view.middle
        
        goButton.sizeToFit()
        goButton.center = CGPointMake(view.middle.x, counterLabel.bottom + 50)
        
        var textFieldSize = CGSizeMake(200, 44)
        fpsTextField.size = textFieldSize
        fpsTextField.center = CGPointMake(view.middle.x, 100)
        
        durationTextField.size = textFieldSize
        durationTextField.center = fpsTextField.center
        durationTextField.top = fpsTextField.bottom + 10
    }
    
    // MARK: - gestures
    func setupTapGestureRecognizer() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("tapped:"))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func tapped(tapGestureRecognizer:UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - textFields
    func styleTextField(textField:TKTextField) {
        textField.backgroundColor = UIColor(white: 0.0, alpha: 0.05)
        textField.keyboardType = UIKeyboardType.NumberPad
        textField.textColor = UIColor.blackColor()
    }
    
    func setupFpsTextField() {
        styleTextField(fpsTextField)
        fpsTextField.placeholder = "FPS"
        fpsTextField.text = "60"
        view.addSubview(fpsTextField)
    }
    
    func setupDurationTextField() {
        styleTextField(durationTextField)
        durationTextField.placeholder = "Duration"
        durationTextField.text = "3.0"
        view.addSubview(durationTextField)
    }
    
    // MARK: - go button
    func setupGoButton() {
        goButton.setTitle("Go", forState: UIControlState.Normal)
        goButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        goButton.addTarget(self, action: Selector("go"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(goButton)
    }
    
    func go() {
        timer.invalidate()
        
        timer.fps = NSString(string: fpsTextField.text).doubleValue
        var duration = NSString(string: durationTextField.text).doubleValue
        
        timer.fire({(time: Double) in
            var ratio = time / duration;
            var value = self.start - self.start * ratio
            self.counterLabel.text = NSString(format: "%f", value)
            self.view.setNeedsLayout()
            
            return true
            }, duration: duration)
    }
    
    // MARK: - counter
    func setupCounterLabel() {
        counterLabel.font = UIFont.systemFontOfSize(40)
        counterLabel.text = NSString(format: "%f", start)
        counterLabel.sizeToFit()
        view.addSubview(counterLabel)
    }
}
