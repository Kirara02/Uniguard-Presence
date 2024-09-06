import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
          _ application: UIApplication,
          didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
          let flutterEngine = (window?.rootViewController as! FlutterViewController).engine
          let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: flutterEngine!.binaryMessenger)

          methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
              if call.method == "getDeviceId" {
                  let deviceId = UIDevice.current.identifierForVendor?.uuidString
                  result(deviceId)
              } else {
                  result(FlutterMethodNotImplemented)
              }
          }

          return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
}
