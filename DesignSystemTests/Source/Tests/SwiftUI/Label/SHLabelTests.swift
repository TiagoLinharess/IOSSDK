//
//  SHLabelTests.swift
//  DesignSystemTests
//
//  Created by Tiago Linhares on 26/07/23.
//

@testable import DesignSystem
import SnapshotTesting
import SwiftUI
import XCTest

final class SHLabelTests: XCTestCase {
    
    override func setUpWithError() throws {
        DesignSystemConfiguration.loadFonts()
    }

    func test_snapshot() throws {
        let sut = Text("Hello label").configureWithSH(color: .blue100, font: .body(.poppins, .medium))
        let vc = UIHostingController(rootView: sut)
        vc.view.frame = .init(x: 0, y: 0, width: 200, height: 100)
        assertSnapshot(matching: vc, as: .image)
    }
}
