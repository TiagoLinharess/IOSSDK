//
//  ApiProviderTests.swift
//  SDKCloudTests
//
//  Created by Tiago Linhares on 06/07/23.
//

import XCTest
@testable import SDKCloud

final class ApiProviderTests: XCTestCase {
    
    var sut: ApiProvider!

    override func setUpWithError() throws {
        sut = ApiProvider()
    }

    override func tearDownWithError() throws {
        sut = nil
        SDKCloudConfiguration.shared.baseUrl = nil
    }

    func test_sut_valid_request_should_return_data() async throws {
        SDKCloudConfiguration.shared.baseUrl = "https://api.github.com"
        let request = ApiRequest<ApiEmptyRequest>(method: .get, endpoint: "/repos/apple/swift", headers: nil, data: nil)
        let data = try? await sut.callMethod(request: request)
        XCTAssertNotNil(data)
    }
    
    func test_sut_no_url_should_return_nil() async throws {
        let request = ApiRequest<ApiEmptyRequest>(method: .get, endpoint: "/repos/apple/swift", headers: nil, data: nil)
        let data = try? await sut.callMethod(request: request)
        XCTAssertNil(data)
    }
    
    func test_sut_invalid_request_should_return_api_error() async throws {
        SDKCloudConfiguration.shared.baseUrl = "https://api.github.com"
        let request = ApiRequest<ApiEmptyRequest>(method: .get, endpoint: "/repos/aaaaa", headers: nil, data: nil)
        
        do {
            let data = try await sut.callMethod(request: request)
            XCTAssertNil(data)
        } catch {
            let apiError = error as? ApiError
            XCTAssertNotNil(apiError)
        }
    }
}
