
import UIKit
import SwiftUI

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {
  
  public var window: UIWindow?
  
  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let window = UIWindow()
    
    let hosting = UIHostingController(rootView: ContentView())
    
    window.rootViewController = hosting
    window.makeKeyAndVisible()
    
    self.window = window
    
    return true
  }
  
}

