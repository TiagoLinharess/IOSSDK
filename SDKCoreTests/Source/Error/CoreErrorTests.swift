//
//  CoreErrorTests.swift
//  SDKCoreTests
//
//  Created by Tiago Linhares on 15/09/23.
//

import XCTest
@testable import SDKCore

final class CoreErrorTests: XCTestCase {

    func test_generic_error() throws {
        let sut: CoreError = CoreError.genericError
        
        XCTAssertEqual(sut.message, CoreConstants.CoreError.genericErrorMessage)
    }
    
    func test_parse_error() throws {
        let sut: CoreError = CoreError.parseError
        
        XCTAssertEqual(sut.message, CoreConstants.CoreError.parseErrorMessage)
    }
    
    func test_custom_error() throws {
        let sut: CoreError = CoreError.customError("test error")
        
        XCTAssertEqual(sut.message, "test error")
    }
}
