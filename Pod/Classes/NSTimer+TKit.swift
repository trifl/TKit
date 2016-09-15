import Foundation

private class Block<T> {
  let f: T
  init (f: T) { self.f = f }
}

public extension Timer {
  public class func tk_scheduledTimer(_ timeInterval: TimeInterval, block: @escaping ()->(), repeats: Bool) -> Timer {
    let block = Block<()->()>.init(f: block)
    return Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(Timer.block(_:)), userInfo: block, repeats: repeats)
  }
  
  public class func tk_scheduledTimer(_ timeInterval: TimeInterval, block: @escaping ()->()) -> Timer {
    return tk_scheduledTimer(timeInterval, block: block, repeats: false)
  }
  
  @objc fileprivate class func block(_ timer: Timer) {
    if let block = timer.userInfo as? Block<()->()> {
      block.f()
    }
  }
}
