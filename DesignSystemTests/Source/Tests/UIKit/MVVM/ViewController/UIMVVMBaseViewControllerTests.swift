//
//  UIMVVMBaseViewControllerTests.swift
//  SDKCoreTests
//
//  Created by Tiago Linhares on 12/07/23.
//

import SnapshotTesting
import XCTest
@testable import DesignSystem

final class UIMVVMBaseViewControllerTests: XCTestCase {
    
    var sut: UIMVVMBaseViewController<EmptyViewModelMock>!

    override func setUpWithError() throws {
        sut = .init(viewModel: EmptyViewModelMock())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_snapshot() throws {
        sut.title = "UIMVVMBaseViewController"
        sut.view.backgroundColor = .white
        let vc = UINavigationController(rootViewController: sut)
        assertSnapshot(matching: vc, as: .image)
    }
}
