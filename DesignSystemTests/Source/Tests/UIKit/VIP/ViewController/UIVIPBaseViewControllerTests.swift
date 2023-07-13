//
//  UIVIPBaseViewControllerTests.swift
//  SDKCoreTests
//
//  Created by Tiago Linhares on 13/07/23.
//

import SnapshotTesting
import XCTest
@testable import DesignSystem

final class UIVIPBaseViewControllerTests: XCTestCase {
    
    var sut: UIVIPBaseViewController<UIView, EmptyInteractorMock, EmptyRouterMock>!

    override func setUpWithError() throws {
        sut = .init(customView: UIView(), interactor: EmptyInteractorMock(), router: EmptyRouterMock())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_snapshot() throws {
        sut.title = "UIVIPBaseViewController"
        sut.view.backgroundColor = .white
        let vc = UINavigationController(rootViewController: sut)
        assertSnapshot(matching: vc, as: .image)
    }
}
