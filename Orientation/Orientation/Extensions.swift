    //
    //  Extensions.swift
    //  ADA-Devices Controller
    //
    //  Created by Ricardo Venieris on 30/04/22.
    //


import SwiftUI
import UIKit

extension UIDeviceOrientation {
    var text:String {
        switch UIDevice.current.orientation {
            case .faceDown:
                return "faceDown"
            case .portrait:
                return "portrait"
            case .portraitUpsideDown:
                return "portraitUpsideDown"
            case .landscapeLeft:
                return "landscapeLeft"
            case .landscapeRight:
                return "landscapeRight"
            case .faceUp:
                return "faceUp"
            case .unknown:
                return "unknown"
            @unknown default:
                return "@unknown"
        }
    }
}

// ------

    // Our custom view modifier to track rotation and
    // call our action
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

    // A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
extension UIApplication {
    var mainKeyWindow: UIWindow? {
        get {
            if #available(iOS 13, *) {
                return connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }
            } else {
                return keyWindow
            }
        }
    }
}


extension UIScreen {
    static var orientation:String {
        guard let interfaceOrientation = UIApplication.shared.mainKeyWindow?.windowScene?.interfaceOrientation else {return "keyWindow undefined"}
        
        switch interfaceOrientation {
            case .portrait:
                return "portrait"
            case .portraitUpsideDown:
                return "portraitUpsideDown"
            case .landscapeLeft:
                return "landscapeLeft"
            case .landscapeRight:
                return "landscapeRight"
            case .unknown:
                return "unknown"
            @unknown default:
                return "@unknown"
        }
    }
}
