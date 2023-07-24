//
//  UISHLabelTests.swift
//  DesignSystemTests
//
//  Created by Tiago Linhares on 24/07/23.
//

@testable import DesignSystem
import SnapshotTesting
import XCTest

final class UISHLabelTests: XCTestCase {
    
    var sut: UISHLabel!
    
    override func setUpWithError() throws {
        DesignSystemConfiguration.loadFonts()
        sut = UISHLabel(text: "Hello UISHLabel", style: .init(color: .blue100, font: .body(.poppins, .regular)))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_text_value() throws {
        XCTAssertEqual(sut.text, "Hello UISHLabel")
    }
    
    func test_change_text() throws {
        sut.text = "Text 2"
        XCTAssertEqual(sut.text, "Text 2")
    }
    
    func test_color_value() throws {
        XCTAssertEqual(sut.textColor, UIColor.blue100)
    }
    
    func test_change_color() throws {
        sut.textColor = .red100
        XCTAssertEqual(sut.textColor, UIColor.red100)
    }
    
    func test_font_value() throws {
        XCTAssertEqual(sut.font, UIFont.body(.poppins, .regular))
    }
    
    func test_change_font() throws {
        sut.font = .caption(.montserrat, .bold)
        XCTAssertEqual(sut.font, UIFont.caption(.montserrat, .bold))
    }
    
    func test_action() throws {
        var closureFired = false
        
        sut.onClick = {
            closureFired = true
        }
        
        sut.labelAction()
        XCTAssertTrue(closureFired)
    }
    
    func test_snapshot() throws {
        sut.frame = .init(x: 0, y: 0, width: 200, height: 100)
        assertSnapshot(matching: sut, as: .image)
    }
}
