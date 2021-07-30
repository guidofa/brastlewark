//
//  BrastlewarkTests.swift
//  BrastlewarkTests
//
//  Created by Guido Fabio on 18/07/2021.
//

import XCTest
@testable import Brastlewark

class BrastlewarkTests: XCTestCase {
    var listInteractor: ListInteractor?
    var detailHeaderCell: DetailHeaderCell!
    let correctUrl = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
    
    override func setUp() {
        super.setUp()
        listInteractor = ListInteractor()
        detailHeaderCell = DetailHeaderCell()
    }
    
    func testUrl_shouldpassIfCorrectUrl() {
        XCTAssertTrue(correctUrl == listInteractor?.getUrl())
    }
    
    func testDataRetrivedFromServer() {
        listInteractor?.loadJson(fromURLString: correctUrl) { (result) in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(GnomesEntity.self, from: data)
                    XCTAssertNotNil(decodedData)
                } catch {
                    XCTFail()
                }
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testGetAgeNotOne() {
        let result = detailHeaderCell.getAgeString(age: 5)
        XCTAssertEqual(result, " years old")
    }
    
    func testGetAgeEqualsOne() {
        let result = detailHeaderCell.getAgeString(age: 1)
        XCTAssertEqual(result, " year old")
    }
}
