import Foundation

extension String {
  public var tk_length: Int { return count(self) }
  
  public func tk_stringByURLEncoding() -> String {
    return CFURLCreateStringByAddingPercentEscapes(
      nil,
      self,
      nil,
      "!*'();:@&=+$,/?%#[]",CFStringBuiltInEncodings.UTF8.rawValue
      ) as String
  }
}
