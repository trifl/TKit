import UIKit
import XCTest

import TKit

class TKUIColorTests: XCTestCase {
  func testHex() {
    let redColor = UIColor.tk_color(0xff0000, alpha: 1)
    let greenColor = UIColor.tk_color(0x00ff00, alpha: 1)
    let blueColor = UIColor.tk_color(0x0000ff, alpha: 1)

    XCTAssertEqual(redColor, UIColor.redColor(), "color should be red")
    XCTAssertEqual(greenColor, UIColor.greenColor(), "color should be green")
    XCTAssertEqual(blueColor, UIColor.blueColor(), "color should be blue")
  }
}
