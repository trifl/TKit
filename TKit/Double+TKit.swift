import Foundation

public extension CGFloat {
  public var tk_thrice: CGFloat { return self * 3.0 }
  public var tk_twice: CGFloat { return self * 2.0 }
  public var tk_half: CGFloat { return self * 0.5 }
  public var tk_third: CGFloat { return self / 3.0 }
  public var tk_fourth: CGFloat { return self * 0.25 }
  public var tk_sixth: CGFloat { return self / 6.0 }
  public var tk_eighth: CGFloat { return self * 0.125 }
  public var tk_twelfth: CGFloat { return self / 12.0 }
  public var tk_sixteenth: CGFloat { return self * 0.0625 }
  public var tk_inverse: CGFloat { return 1.0 / self }
}