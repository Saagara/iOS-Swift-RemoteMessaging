import Foundation
import UIKit

class RemoteMessageManager {
    // keys for user prefs
    private let KEY_LAST_REMOTE_MESSAGE_CHECK = "LastRemoteMessageCheck"
    private let KEY_IS_PURCHASED = "IsPurchased"
    
    // image urls
    private let LITE_IMAGE_URL = "http://(image).jpg"
    private let FULL_IMAGE_URL = "http://(image).jpg"
    
    // links for when images clicked
    private let LITE_LINK_URL = "http://www.google.com"
    private let FULL_LINK_URL = "http://www.google.com"
    
    
    
    var IsPurchased : Bool {
        get {
            return NSUserDefaults.standardUserDefaults().boolForKey(KEY_IS_PURCHASED)
        }
        set {
            return NSUserDefaults.standardUserDefaults().setBool(newValue, forKey: KEY_IS_PURCHASED)
        }
    }
    
    var RemoteImageUrl : NSURL {
        let url = self.IsPurchased ? FULL_IMAGE_URL : LITE_IMAGE_URL
        
        return NSURL(string: url)!
    }
    
    var RemoteLinkUrl : NSURL {
        let url = self.IsPurchased ? FULL_LINK_URL : LITE_LINK_URL
        
        return NSURL(string: url)!
        
    }
    
    var IsMessageAvailable : Bool {
        return self.RemoteImage != nil
    }
    
    var LastCheckTime : NSTimeInterval {
        get {
            return NSUserDefaults.standardUserDefaults().doubleForKey(KEY_LAST_REMOTE_MESSAGE_CHECK)
        }
        set {
            return NSUserDefaults.standardUserDefaults().setDouble(newValue, forKey: KEY_LAST_REMOTE_MESSAGE_CHECK)
        }
    }
    
    
    var TimeSinceLastCheck : NSTimeInterval {
        return self.CurrentTime - self.LastCheckTime
    }
    
    /// number of seconds in a day
    private let DAY = 86400.0
    
    var IsReady : Bool {
        // check to see if it is time to check for remote message
        
        // if we have never checked, or the last check was more than 2 days ago, or lite version and 1 day ago
        if self.LastCheckTime == 0 || self.TimeSinceLastCheck > (DAY * 2) ||
            (self.IsPurchased && self.TimeSinceLastCheck > DAY) {
                return true
        }
        
        return false
    }
    
    private var CurrentTime : NSTimeInterval {
        return NSDate().timeIntervalSince1970
    }
    
    init() {
        
        
    }
    
    var RemoteImage : UIImage?
    
    func AttemptToLoadRemoteImage() {
        var response : NSURLResponse?
        
        let request = NSURLRequest(URL: self.RemoteImageUrl, cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: 5.0)
        
        
        do {
            let data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            
            self.RemoteImage = UIImage(data: data)
            
        } catch {
            print("Remote Mesage -> Error while loading remote image")
        }
    }
    
    func OpenLink() {
        UIApplication.sharedApplication().openURL(self.RemoteLinkUrl)
    }
}
