//
//  UISHButtonTests.swift
//  DesignSystemTests
//
//  Created by Tiago Linhares on 26/07/23.
//

@testable import DesignSystem
import SnapshotTesting
import XCTest

final class UISHButtonTests: XCTestCase {
    
    var sut: UISHButton!
    
    override func setUpWithError() throws {
        DesignSystemConfiguration.loadFonts()
        sut = UISHButton(
            text: "Hello UISHButton",
            style: .init(type: .primary, mainColor: .blue100, alternativeColor: .lightContent, font: .body(.poppins, .medium)),
            action: nil
        )
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_text_value() throws {
        XCTAssertEqual(sut.text, "Hello UISHButton")
    }
    
    func test_change_text() throws {
        sut.text = "Text 2"
        XCTAssertEqual(sut.text, "Text 2")
    }
    
    func test_snapshot_button_primary() throws {
        sut.frame = .init(x: 0, y: 0, width: 200, height: 100)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func test_snapshot_button_secondary() throws {
        sut.style = .init(type: .secondary, mainColor: .green100, alternativeColor: .clear, font: .body(.poppins, .bold))
        sut.frame = .init(x: 0, y: 0, width: 200, height: 100)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func test_snapshot_button_ghost() throws {
        sut.style = .init(type: .ghost, mainColor: .red100, alternativeColor: .clear, font: .body(.poppins, .bold))
        sut.frame = .init(x: 0, y: 0, width: 200, height: 100)
        assertSnapshot(matching: sut, as: .image)
    }
}
