extension Array {
  mutating func tk_remove<U: Equatable>(object: U) -> Bool {
    for (idx, objectToCompare) in enumerate() {
      if let to = objectToCompare as? U {
        if object == to {
          removeAtIndex(idx)
          return true
        }
      }
    }
    return false
  }
}