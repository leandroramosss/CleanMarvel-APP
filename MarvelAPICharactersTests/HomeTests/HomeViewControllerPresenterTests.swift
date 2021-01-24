//
//  HomeViewControllerPresenterTests.swift
//  MarvelAPICharactersTests
//
//  Created by Leandro Ramos on 1/23/21.
//

import XCTest
@testable import MarvelAPICharacters

class HomeViewControllerPresenterTests: XCTestCase {

    var sut: HomeViewControllerPresenter!
    
    override func setUp() {
      super.setUp()
        setupHomeViewControllerPresenter()
    }

    override func tearDown() {
      super.tearDown()
    }

    func setupHomeViewControllerPresenter() {
      sut = HomeViewControllerPresenter()
    }
    
    class HomeViewControllerDisplayLogicSpy: HomeViewControllerDisplayLogic {
        var displayData = false
        var displayHeroes = false
        
        func displayFetchedData(viewModel: HomeViewControllerModels.FetchData.ViewModel) {
            displayData = true
        }
        
        func displayFetchedHeroesData(viewModel: HomeViewControllerModels.FetchCharacterData.ViewModel) {
            displayHeroes = true
        }
        
    }
    
    
    func testPresentCharactes() {
        let mock = Mock.CharacterMock()
        let spy = HomeViewControllerDisplayLogicSpy()
        sut.viewController = spy
        let response = HomeViewControllerModels.FetchData.Response(character: [mock.venom])
        
        sut.presentSearchResult(response: response)
        
        XCTAssertTrue(spy.displayData, "presentSomething(response:) should ask the view controller to display the result")
        
    }
    
    func testPresentAllCharacters() {
        let mock = Mock.CharacterMock()
        let spy = HomeViewControllerDisplayLogicSpy()
        sut.viewController = spy
        let response = HomeViewControllerModels.FetchCharacterData.Response(characters: [mock.venom])
        sut.presentListOfHeroes(response: response)
        
        XCTAssertTrue(spy.displayHeroes, "presentSomething(response:) should ask the view controller to display the result")
        
    }
    
}
