import UIKit
import ModernRIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  private var launchRouter: LaunchRouting?
  private var urlHandler: URLHandler?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    
      //1. AppDelegate에서 AppRootBuilder를 빌드한다. 빌더에는 인자로 dependency: component가 들어간다.
    let result = AppRootBuilder(dependency: AppComponent()).build()
    self.launchRouter = result.launchRouter
    self.urlHandler = result.urlHandler
    launchRouter?.launch(from: window)
    
    return true
  }
  
}

protocol URLHandler: AnyObject {
  func handle(_ url: URL)
}
