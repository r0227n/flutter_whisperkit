import Cocoa
import FlutterMacOS
import WhisperKit

public class FlutterWhisperkitApplePlugin: NSObject, FlutterPlugin {
  private var implementation: WhisperKitImplementation?
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_whisperkit_apple", binaryMessenger: registrar.messenger)
    let instance = FlutterWhisperkitApplePlugin()
    instance.implementation = WhisperKitImplementation()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
