//
//  UIImageViewTests.swift
//  SDKCoreTests
//
//  Created by Tiago Linhares on 13/07/23.
//

import SnapshotTesting
import XCTest
@testable import SDKCore

final class UIImageViewTests: XCTestCase {
    
    var imageExpectation: XCTestExpectation!
    var sut: UIImageView!

    override func setUpWithError() throws {
        imageExpectation = XCTestExpectation(description: "testImageShouldAppear")
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
        imageExpectation = nil
    }

    func test_snapshot_success() throws {
        sut.load(url: URL(string: "https://avatars.githubusercontent.com/u/10639145?s=200&v=4"))
        sut.cornerRadius(radius: 32.00)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            assertSnapshot(matching: self.sut, as: .image)
            self.imageExpectation.fulfill()
        }
        
        wait(for: [imageExpectation], timeout: 3)
    }
    
    func test_snapshot_error() throws {
        sut.load(url: URL(string: ""))

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            assertSnapshot(matching: self.sut, as: .image)
            self.imageExpectation.fulfill()
        }
        
        wait(for: [imageExpectation], timeout: 6)
    }
}
