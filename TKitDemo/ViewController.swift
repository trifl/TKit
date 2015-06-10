//
//  ViewController.swift
//  TKitDemo
//
//  Created by JP McGlone on 6/9/15.
//  Copyright (c) 2015 trifl. All rights reserved.
//

import UIKit
import TKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    var view1 = UIView(frame: CGRectMake(0, 100, 25, 25))
    view1.backgroundColor = .greenColor()
    view.addSubview(view1)
    
    var view2 = UIView(frame: CGRectMake(0, 100, 25, 25))
    view2.backgroundColor = .redColor()
    view.addSubview(view2)
    
    var view3 = UIView(frame: CGRectMake(0, 100, 25, 25))
    view3.backgroundColor = .redColor()
    view.addSubview(view3)
    
    view.tk_layout(.Horizontal, views: [1, view1, 0.5, view2, 0.5, view3,  1])
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

