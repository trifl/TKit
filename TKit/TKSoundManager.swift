import Foundation
import AVFoundation


public class TKSoundManager: NSObject {
  // MARK: - Constants
  public let kDefaultExtension = "wav"

  // MARK: - Singleton
  public static let sharedInstance = TKSoundManager()
  
  // MARK: - Private Variables
  private var soundIDs = [String:SystemSoundID]()

  // MARK: - Public
  public func prepareSound(#fileName: String) -> SystemSoundID? {
    let fixedSoundFileName = self.fixedSoundFileName(fileName: fileName)
    if let soundID = soundIDForKey(fixedSoundFileName) {
      return soundID
    }
    
    if let pathURL = pathURLForSound(fileName: fixedSoundFileName) {
      var soundID: SystemSoundID = 0
      AudioServicesCreateSystemSoundID(pathURL, &soundID)
      soundIDs[fixedSoundFileName] = soundID
      return soundID
    }
    
    return nil
  }
  
  public func playSound(#fileName: String) {
    let fixedSoundFileName = self.fixedSoundFileName(fileName: fileName)
    var soundID = soundIDForKey(fixedSoundFileName)
    if soundID == nil {
      soundID = prepareSound(fileName: fileName)
    }
    if soundID != nil {
      AudioServicesPlaySystemSound(soundID!)
    } else {
      // log?
    }
  }
  
  public func removeSound(#fileName: String) {
    let fixedSoundFileName = self.fixedSoundFileName(fileName: fileName)
    var sid = soundIDForKey(fixedSoundFileName)
    if sid != nil {
      AudioServicesDisposeSystemSoundID(sid!)
      soundIDs.removeValueForKey(fixedSoundFileName)
    }
  }

  // MARK: - Private
  private func soundIDForKey(key: String) -> SystemSoundID? {
    return soundIDs[key]
  }
  
  private func fixedSoundFileName(#fileName: String) -> String {
    var fixedSoundFileName = fileName.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    var soundFileComponents = fixedSoundFileName.componentsSeparatedByString(".")
    if soundFileComponents.count == 1 {
      fixedSoundFileName = "\(soundFileComponents[0]).\(kDefaultExtension)"
    } else if soundFileComponents.count == 2 {
      // keep it the way it is
    } else {
      // ?
    }
    return fixedSoundFileName
  }
  
  private func pathForSound(#fileName: String) -> String? {
    let fixedSoundFileName = self.fixedSoundFileName(fileName: fileName)
    let components = fixedSoundFileName.componentsSeparatedByString(".")
    return NSBundle.mainBundle().pathForResource(components[0], ofType: components[1])
  }
  
  private func pathURLForSound(#fileName: String) -> NSURL? {
    if let path = pathForSound(fileName: fileName) {
      return NSURL(fileURLWithPath: path)
    }
    return nil
  }
}
