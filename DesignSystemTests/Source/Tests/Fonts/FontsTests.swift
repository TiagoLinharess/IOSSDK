//
//  FontsTests.swift
//  DesignSystemTests
//
//  Created by Tiago Linhares on 13/07/23.
//

import SnapshotTesting
import XCTest
@testable import DesignSystem

final class FontsTests: XCTestCase {

    override func setUpWithError() throws {
        DesignSystemConfiguration.loadFonts()
    }

    func test_snapshot() throws {
        let label = UILabel()
        label.text = "Hello test"
        label.font = .title1(.poppins, .bold)
        
        assertSnapshot(matching: label, as: .image)
    }
}
