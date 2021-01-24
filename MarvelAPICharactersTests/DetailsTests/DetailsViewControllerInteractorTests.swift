//
//  DetailsViewControllerInteractorTests.swift
//  MarvelAPICharactersTests
//
//  Created by Leandro Ramos on 1/23/21.
//

import XCTest
@testable import MarvelAPICharacters

class DetailsViewControllerInteractorTests: XCTestCase {

    var sut: DetailsViewControllerInteractor!
    
    override func setUp() {
      super.setUp()
        setupDetailsViewControllerInteractor()
    }

    override func tearDown() {
      super.tearDown()
    }

    func setupDetailsViewControllerInteractor() {
      sut = DetailsViewControllerInteractor()
    }
    
    class DetailsViewControllerPresentationLogicSpy: DetailsViewControllerPresentationLogic {
        
        var presentCharacter = false
        var presentComics = false
        var presentSeries = false
        var presentEvents = false
        
        func presentCharacter(response: DetailsView.SelectedCharacter.Response) {
            presentCharacter = true
        }
        
        func presentComics(request: DetailsView.CollectionViewData.Response) {
            presentComics = true
        }
        
        func presentSeries(request: DetailsView.CollectionViewData.Response) {
            presentSeries = true
        }
        
        func presentEvents(request: DetailsView.CollectionViewData.Response) {
            presentEvents = true
        }
        
    }
    
    func testRequestCharacter() {
        let venom = Mock.CharacterMock().venom
        let spy = DetailsViewControllerPresentationLogicSpy()
        sut.presenter = spy
        
        let request = DetailsView.SelectedCharacter.Request(character: venom)
        
        sut.requestCharacterData(request: request)
        
        XCTAssertTrue(spy.presentCharacter, "doSomething(request:) should ask the presenter to format the result")
    }
        
}
