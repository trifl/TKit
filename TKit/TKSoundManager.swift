import Foundation
// import AVFoundation

public class TKSoundManager: NSObject {
//  public static let sharedInstance = TKSoundManager()
//  
//  private var soundIDs = [String:SystemSoundID]()
//  public let kDefaultExtension = "wav"
//  
//  private func soundIDForKey(key: String) -> SystemSoundID? {
//    return soundIDs[key]
//  }
//  
//  private func fixedSoundFileName(#fileName: String) -> String {
//    var fixedSoundFileName = fileName.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
//    var soundFileComponents = fixedSoundFileName.componentsSeparatedByString(".")
//    if soundFileComponents.count == 1 {
//      fixedSoundFileName = "\(soundFileComponents[0]).\(kDefaultExtension)"
//    } else if soundFileComponents.count == 2 {
//      // keep it the way it is
//    } else {
//      // TODO: ?
//    }
//    return fixedSoundFileName
//  }
//  
//  private func pathForSound(#fileName: String) -> String? {
//    let fixedSoundFileName = self.fixedSoundFileName(fileName: fileName)
//    let components = fixedSoundFileName.componentsSeparatedByString(".")
//    return NSBundle.mainBundle().pathForResource(components[0], ofType: components[1])
//  }
//  
//  private func pathURLForSound(#fileName: String) -> NSURL? {
//    if let path = pathForSound(fileName: fileName) {
//      return NSURL(fileURLWithPath: path)
//    }
//    return nil
//  }
//  
//  private func prepareSound(#fileName: String) -> SystemSoundID? {
//    let fixedSoundFileName = self.fixedSoundFileName(fileName: fileName)
//    if let sid = soundIDForKey(fixedSoundFileName) {
//      return sid
//    }
//    
//    if let pathURL = pathURLForSound(fileName: fixedSoundFileName) {
//      var sid: SystemSoundID = 0
//      AudioServicesCreateSystemSoundID(pathURL, &sid)
//      soundIDs[fixedSoundFileName] = sid
//      return sid
//    }
//    
//    return nil
//  }
//  
//  public func playSound(#fileName: String) {
//    let fixedSoundFileName = self.fixedSoundFileName(fileName: fileName)
//    var sid = soundIDForKey(fixedSoundFileName)
//  }
//  
}
