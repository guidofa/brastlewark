//
//  ListViewControllerTests.swift
//  BrastlewarkTests
//
//  Created by Guido Fabio on 10/09/2021.
//

import Foundation
import XCTest
@testable import Brastlewark

class ListViewControllerTests: XCTestCase {
    func testViewDidLoadRenderTitle() {
        if let sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ListViewController") as? ListViewController {
            sut.loadViewIfNeeded()
            XCTAssertEqual(sut.title, "BrastleWark")
        }
    }
}
