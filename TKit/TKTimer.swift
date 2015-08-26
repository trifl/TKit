import Foundation

public class TKTimer {
  public var fps = 60.0
  
  private var initialDate: NSDate!
  private var timer = NSTimer()
  private var timeFunction: ((Double) -> Bool)?
  private var duration = 0.0
  private var usesDuration = false
  
  public init(fps: Double) {
    self.fps = fps
  }
  
  public func fire(function:(time: Double) -> Bool) {
    fire(function, duration: 0)
    usesDuration = false
  }
  
  public func fire(function:(time: Double) -> Bool, duration: NSTimeInterval) {
    invalidate()
    timeFunction = function
    initialDate = NSDate()
    self.duration = duration
    timer = NSTimer.scheduledTimerWithTimeInterval(
      1.0 / fps,
      target: self,
      selector: Selector("fireTimeFunction"),
      userInfo: nil,
      repeats: true
    )
  }
  
  public func invalidate() {
    timer.invalidate()
    duration = 0.0
    usesDuration = true
  }
  
  private func fireTimeFunction() {
    if let timeFunction = timeFunction {
      var time = NSDate().timeIntervalSinceDate(initialDate)
      
      // This makes sure it always ends at duration where you are intending it to end, unless
      // explicitly stopped
      if usesDuration {
        time = min(time, duration)
      }
      
      let stop = !timeFunction(time)
      if stop || (usesDuration && time == duration) {
        invalidate()
      }
    }
  }
}
