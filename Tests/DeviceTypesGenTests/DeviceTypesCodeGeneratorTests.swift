//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2021/06/30.
//

import XCTest
@testable import DeviceTypesGen

class DeviceTypesCodeGeneratorTests: XCTestCase {
    func testGenerate() {
        let deviceTypes = [
            DeviceType(name: "iPhone X", identifier: "dev.noppe.iPhone-X"),
            DeviceType(name: "iPhone 12", identifier: "dev.noppe.iPhone-12"),
        ]
        let generator = DeviceTypesCodeGenerator(deviceTypes: deviceTypes)
        print(generator.generate())
    }
}
