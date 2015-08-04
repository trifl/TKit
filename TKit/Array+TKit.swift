extension Array {
  mutating func tk_remove<U: Equatable>(object: U) -> Bool {
    for (idx, objectToCompare) in enumerate(self) {
      if let to = objectToCompare as? U {
        if object == to {
          self.removeAtIndex(idx)
          return true
        }
      }
    }
    return false
  }
}