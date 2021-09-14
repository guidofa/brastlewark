//
//  BrastlewarkTests.swift
//  BrastlewarkTests
//
//  Created by Guido Fabio on 18/07/2021.
//

import XCTest
@testable import Brastlewark

class BrastlewarkTests: XCTestCase {
    var correctUrl: String!
    
    override func setUp() {
        super.setUp()
        correctUrl = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
    }
    
    override func tearDown() {
        super.tearDown()
        correctUrl = nil
    }
    
    func testUrl_shouldpassIfCorrectUrl() {
        let sut = ListInteractor()
        XCTAssertTrue(correctUrl == sut.getUrl())
    }
    
    func testDataRetrivedFromServer() {
        Network.loadJson(fromURLString: correctUrl) { (result) in
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
        // given
        let sut = DetailHeaderCell()
        
        // when
        let result = sut.getAgeString(age: 5)
        
        //then
        XCTAssertEqual(result, " years old")
    }
    
    func testGetAgeEqualsOne() {
        // given
        let sut = DetailHeaderCell()
        
        // when
        let result = sut.getAgeString(age: 1)
        
        //then
        XCTAssertEqual(result, " year old")
    }
}
