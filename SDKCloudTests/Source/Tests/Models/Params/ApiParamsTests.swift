//
//  ApiParamsTests.swift
//  SDKCloudTests
//
//  Created by Tiago Linhares on 09/07/23.
//

import XCTest
@testable import SDKCloud

final class ApiParamsTests: XCTestCase {

    func test_valid_data_should_return_not_nil() throws {
        let requestData = try? JSONEncoder().encode(ExampleParamModel(name: "Jhon Doe", age: 20))
        let queryItems = ApiParams.getUrlParamsFromData(data: requestData)
        XCTAssertNotNil(queryItems)
    }
    
    func test_invalid_data_should_return_nil() throws {
        let requestData: Data? = nil
        let queryItems = ApiParams.getUrlParamsFromData(data: requestData)
        XCTAssertNil(queryItems)
    }
}
