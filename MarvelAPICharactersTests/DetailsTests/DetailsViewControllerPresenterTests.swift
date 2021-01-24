//
//  DetailsViewControllerPresenterTests.swift
//  MarvelAPICharactersTests
//
//  Created by Leandro Ramos on 1/24/21.
//

import XCTest
@testable import MarvelAPICharacters

class DetailsViewControllerPresenterTests: XCTestCase {
    
    var sut: DetailsViewControllerPresenter!
    
    override func setUp() {
      super.setUp()
        setupDetailsViewControllerPresenter()
    }

    override func tearDown() {
      super.tearDown()
    }
    
    func setupDetailsViewControllerPresenter() {
      sut = DetailsViewControllerPresenter()
    }
    
    class DetailsViewControllerDisplayLogicSpy: DetailsViewControllerDisplayLogic {
        
        var displayedCharacter = false
        var requestComics = false
        var requestSeries = false
        var requestEvents = false
        
        func displayedCharacter(viewModel: DetailsView.SelectedCharacter.ViewModel) {
            displayedCharacter = true
        }
        
        func requestComics(viewModel: DetailsView.CollectionViewData.ViewModel) {
            requestComics = true
        }
        
        func requestSeries(viewModel: DetailsView.CollectionViewData.ViewModel) {
            requestSeries = true
        }
        
        func requestEvents(viewModel: DetailsView.CollectionViewData.ViewModel) {
            requestEvents = true
        }
        
    }
    
    func testPresentCharacter() {
        let charMock = Mock.CharacterMock()
        let venom = charMock.venom
        let spy = DetailsViewControllerDisplayLogicSpy()
        sut.viewController = spy
        
        let response = DetailsView.SelectedCharacter.Response(name: venom.name, thumbnailResource: charMock.imageResource, description: venom.description)
        sut.presentCharacter(response: response)
        
        XCTAssertTrue(spy.displayedCharacter, "presentSomething(response:) should ask the view controller to display the result")
        
    }
    
}
