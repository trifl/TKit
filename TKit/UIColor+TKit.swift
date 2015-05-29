//
//  UIColor+TKit.swift
//  TKit
//
//  Created by JP McGlone on 5/28/15.
//  Copyright (c) 2015 trifl. All rights reserved.
//

import Foundation

extension UIColor {
  public class func tk_color(hex:Int, alpha: CGFloat) -> UIColor {
    var red = (hex >> 16) & 0xff
    var green = (hex >> 8) & 0xff
    var blue = hex & 0xff
    return UIColor(red:CGFloat(red), green:CGFloat(green), blue:CGFloat(blue), alpha:alpha)
  }
  
  public class func tk_color(hex:Int) -> UIColor {
    return UIColor.tk_color(hex, alpha: 1)
  }
}