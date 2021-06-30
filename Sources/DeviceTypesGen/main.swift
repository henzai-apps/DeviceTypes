//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2021/06/30.
//

import Foundation
import SwiftShell

let result = run("xcrun", "simctl", "list", "devicetypes")
let decoder = DeviceTypesDecoder()
let deviceTypes = try decoder.decode(stdout: result.stdout)
let generator = DeviceTypesCodeGenerator(deviceTypes: deviceTypes)
print(generator.generate())

