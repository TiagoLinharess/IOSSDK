//
//  ApiErrorTests.swift
//  SDKCloudTests
//
//  Created by Tiago Linhares on 10/07/23.
//

import XCTest
@testable import SDKCloud

final class ApiErrorTests: XCTestCase {

    func test_invalid_error_should_http_response_be_nil_and_default_message_be_default() throws {
        let sut: Error = ApiError.genericError
        let model = sut.parseError(ApiEmptyResponse.self)
        
        XCTAssertNil(model.response)
        XCTAssertEqual(model.defaultMessage, CloudConstants.Error.defaultMessage)
    }
    
    func test_valid_error_should_http_response_be_not_nil_and_default_message_be_default() throws {
        let requestData = try JSONEncoder().encode(ExampleParamModel(name: "Jhon Doe", age: 20))
        let sut: Error = ApiError.httpError(requestData, 400)
        let model = sut.parseError(ExampleParamModel.self)
        
        XCTAssertNotNil(model.response)
        XCTAssertEqual(model.defaultMessage, CloudConstants.Error.defaultMessage)
    }
}
