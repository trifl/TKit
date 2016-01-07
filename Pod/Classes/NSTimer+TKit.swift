import Foundation

private class Block<T> {
  let f: T
  init (f: T) { self.f = f }
}

public extension NSTimer {
  public class func tk_scheduledTimer(timeInterval: NSTimeInterval, block: ()->(), repeats: Bool) -> NSTimer {
    let block = Block<()->()>(f: block)
    return NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: Selector("block:"), userInfo: block, repeats: repeats)
  }
  
  public class func tk_scheduledTimer(timeInterval: NSTimeInterval, block: ()->()) -> NSTimer {
    return tk_scheduledTimer(timeInterval, block: block, repeats: false)
  }
  
  @objc private class func block(timer: NSTimer) {
    if let block = timer.userInfo as? Block<()->()> {
      block.f()
    }
  }
}
