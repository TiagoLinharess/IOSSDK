//
//  ApiWorkerTests.swift
//  SDKCloudTests
//
//  Created by Tiago Linhares on 06/07/23.
//

import XCTest
@testable import SDKCloud

final class ApiWorkerTests: XCTestCase {
    
    var sut: ApiWorker!
    var requestMock = ApiRequest<ApiEmptyRequest>(method: .get, endpoint: String(), headers: nil, data: nil)

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_sut_valid_request_should_return_response() async throws {
        let providerMock = ApiProviderMock(status: .success(.init()))
        sut = ApiWorker(apiProvider: providerMock)
        let data = try? await sut.perform(ApiProviderMock.Model.self, request: requestMock)
        XCTAssertNotNil(data)
    }
    
    func test_sut_invalid_request_should_return_api_error() async throws {
        let providerMock = ApiProviderMock(status: .error)
        sut = ApiWorker(apiProvider: providerMock)
        do {
            let _ = try await sut.perform(ApiProviderMock.Model.self, request: requestMock)
        } catch {
            let apiError = error as? ApiError
            XCTAssertNotNil(apiError)
        }
    }
}
