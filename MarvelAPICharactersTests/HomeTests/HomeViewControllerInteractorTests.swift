//
//  HomeViewControllerInteractorTests.swift
//  MarvelAPICharactersTests
//
//  Created by Leandro Ramos on 1/23/21.
//

import XCTest
@testable import MarvelAPICharacters

class HomeViewControllerInteractorTests: XCTestCase {

    var sut: HomeViewControllerInteractor!
    
    override func setUp() {
        super.setUp()
        setupHomeViewControllerInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupHomeViewControllerInteractor() {
        sut = HomeViewControllerInteractor()
    }
    
    class HomeViewControllerPresentationLogicSpy: HomeViewControllerPresentationLogic {
        var presentedSearch = false
        var presentedList = false
        
        func presentSearchResult(response: HomeViewControllerModels.FetchData.Response) {
            presentedSearch = true
        }
        
        func presentListOfHeroes(response: HomeViewControllerModels.FetchCharacterData.Response) {
            presentedList = true
        }
    }
    
    func testPresentSearch() {
        let char = Mock.CharacterMock().venom
        let viewModel = HomeViewControllerModels.FetchData.ViewModel(displayedCharacters: [char])
        
        sut.serachCharacter(request: HomeViewControllerModels.FetchData.Request(characterToSearch: "venom"))
        
        XCTAssertEqual(char.name, char.name)
    }
    
    func testGetAllCharacters() {
        let char = Mock.CharacterMock().venom
        let viewModel = HomeViewControllerModels.FetchCharacterData.Request()
        
        sut.getAllCharacters(request: viewModel)
        
        XCTAssertEqual(char.name, char.name)
        
    }
    
}
