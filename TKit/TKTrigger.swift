import UIKit

public struct TKTrigger {
  let condition: () -> Bool
  let action: TKTrigger -> ()
  
  init(condition: () -> Bool, action: TKTrigger -> ()) {
    self.condition = condition
    self.action = action
  }
  
  public func pull() {
    if condition() {
      action(self)
    }
  }
}
