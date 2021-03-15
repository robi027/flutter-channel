import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    let platform = "com.robi027.flutterchannel/native"
    var resultFlutter : FlutterResult?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: platform, binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler {
            (call : FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            self.resultFlutter = result
            switch (call.method){
            case "TONATIVE":
                UIView.animate(withDuration: 0.5, animations: {
                    self.window.rootViewController = nil
                    let viewToPush = SecondViewController()
                    let navigationController = UINavigationController(rootViewController: controller)
                    
                    self.window = UIWindow(frame: UIScreen.main.bounds)
                    self.window?.makeKeyAndVisible()
                    self.window?.rootViewController = navigationController
                    navigationController.isNavigationBarHidden = true
                    navigationController.pushViewController(viewToPush, animated: true)
                })
                break
            default:
                break
            }
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
}
