//
//  SHButtonTests.swift
//  DesignSystemTests
//
//  Created by Tiago Linhares on 01/08/23.
//

@testable import DesignSystem
import SnapshotTesting
import SwiftUI
import XCTest

final class SHButtonTests: XCTestCase {
    
    override func setUpWithError() throws {
        DesignSystemConfiguration.loadFonts()
    }

    func test_primary_button_snapshot() throws {
        let sut = Button("SHButton", action: {}).primarySHStyle(backgroundColor: .blue100, foregroundColor: .lightContent, font: .body(.poppins, .medium))
        let vc = UIHostingController(rootView: sut)
        vc.view.frame = .init(x: 0, y: 0, width: 200, height: 100)
        assertSnapshot(matching: vc, as: .image)
    }
    
    func test_secondary_button_snapshot() throws {
        let sut = Button("SHButton", action: {}).secondarySHStyle(color: .green100, font: .body(.montserrat, .medium))
        let vc = UIHostingController(rootView: sut)
        vc.view.frame = .init(x: 0, y: 0, width: 200, height: 100)
        assertSnapshot(matching: vc, as: .image)
    }
    
    func test_ghost_button_snapshot() throws {
        let sut = Button("SHButton", action: {}).ghostSHStyle(color: .red100, font: .body(.montserrat, .medium))
        let vc = UIHostingController(rootView: sut)
        vc.view.frame = .init(x: 0, y: 0, width: 200, height: 100)
        assertSnapshot(matching: vc, as: .image)
    }
}
