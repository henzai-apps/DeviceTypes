//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2021/06/30.
//

import Foundation

struct DeviceTypesCodeGenerator {
    let deviceTypes: [DeviceType]
    
    func variableName(_ string: String) -> String {
        string
            .split(separator: " ")
            .map({ $0.prefix(1).uppercased() + $0.dropFirst() })
            .joined()
            .replacingOccurrences(of: "-", with: "_")
            .replacingOccurrences(of: "(", with: "_")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: ".", with: "_")
            .lowercasedFirstLetter()
    }
    
    func deviceTypeCode(_ deviceType: DeviceType) -> String {
        """
            /// \(deviceType.name)
            /// \(deviceType.identifier)
            case \(variableName(deviceType.name)) = "\(deviceType.name)"
        """
    }
    
    func deviceTypeCodes() -> String {
        deviceTypes.map(deviceTypeCode(_:)).joined(separator: "\n\n")
    }
    
    func generate() -> String {
        """
        /// Generated by DeviceTypesGen
        
        public enum DeviceType: String, CaseIterable {
        \(deviceTypeCodes())
        }
        
        // ----
        
        import SwiftUI
        
        public extension PreviewDevice {
            init(_ deviceType: DeviceType) {
                self.init(rawValue: deviceType.rawValue)
            }
        }
        
        public extension View {
            func previewDevice(_ deviceType: DeviceType) -> some View {
                previewDevice(PreviewDevice(deviceType))
            }
        }
        """
    }
}

extension String {
    func strip<T: StringProtocol>(_ string: T) -> String {
        self.replacingOccurrences(of: string, with: "")
    }
    
    func lowercasedFirstLetter() -> String {
      prefix(1).lowercased() + self.dropFirst()
    }
}
