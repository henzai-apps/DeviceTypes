//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2021/06/30.
//

import Foundation

struct DeviceTypesDecoder {
    enum DecodeError: Error {
        case invalidFormat
    }
    let header = "== Device Types =="
    
    func decode(stdout: String) throws -> [DeviceType] {
        let lines = stdout.lines()
        guard !lines.isEmpty else { throw DecodeError.invalidFormat }
        guard lines[0] == header else { throw DecodeError.invalidFormat }
        let deviceTypeSources = lines[1..<lines.count]
        var deviceTypes: [DeviceType] = []
        for source in deviceTypeSources {
            // iPhone SE (1st generation) (com.apple.CoreSimulator.SimDeviceType.iPhone-SE)
            // TODO: regex (.+?) \((.+?)\)
            let separator: Character = " "
            let identifier = source.split(separator: separator).last!.dropFirst().dropLast()
            let name = source.split(separator: separator).dropLast().joined(separator: String(separator))
            let deviceType = DeviceType(name: name, identifier: String(identifier))
            deviceTypes.append(deviceType)
        }
        return deviceTypes
    }
}
