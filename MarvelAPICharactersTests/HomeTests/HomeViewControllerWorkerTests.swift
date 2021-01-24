//
//  HomeViewControllerWorkerTests.swift
//  MarvelAPICharactersTests
//
//  Created by Leandro Ramos on 1/23/21.
//

import XCTest
@testable import MarvelAPICharacters

class HomeViewControllerWorkerTests: XCTestCase {

    var sut: HomeViewControllerWorker!
    
    override func setUp() {
        super.setUp()
        setupHomeViewControllerWorker()
    }

    override func tearDown() {
        super.tearDown()
    }

    func setupHomeViewControllerWorker() {
        sut = HomeViewControllerWorker()
    }
    
    func testSearch() {
        let expec = expectation(description: "Parsing Search")
        
        sut.searchHero(string: "Venom") { (_, error) in
            if error == nil {
                expec.fulfill()
            } else {
                XCTFail("error is not nil.")
            }
        }
        
        waitForExpectations(timeout: 60) { (_) -> Void in
            print("response")
        }

    }
    
    func tetsComicThumbnail() {
        let expec = expectation(description: "Parsing Comics")
        let venom = Mock.CharacterMock().venom
        
        sut.getComicThumbnail(url: venom.resourceURI) { (_, error) in
            if error == nil {
                expec.fulfill()
            } else {
                XCTFail("error is not nil.")
            }
        }
        
        waitForExpectations(timeout: 60) { (_) -> Void in
            print("response")
        }
        
    }
    
    func testListOfCharacter() {
        let expec = expectation(description: "Parsing List")
        let char: [Character]?
        
        sut.listAllCharacters { (char, error) in
            if error == nil {
                expec.fulfill()
            } else {
                XCTFail("error is not nil.")
            }
        }
        
        waitForExpectations(timeout: 60) { (_) -> Void in
            print("response")
        }
        
    }
    
}
