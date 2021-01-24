//
//  HomeViewControllerTests.swift
//  MarvelAPICharactersTests
//
//  Created by Leandro Ramos on 1/23/21.
//

import XCTest
@testable import MarvelAPICharacters

class HomeViewControllerTests: XCTestCase {

    var sut: HomeViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupHomeViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func setupHomeViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    class HomeViewControllerBusinessLogicSpy: HomeViewControllerBusinessLogic {
        var serchCalled = false
        var charactersCalled = false

        func serachCharacter(request: HomeViewControllerModels.FetchData.Request) {
            serchCalled = true
        }

        func getAllCharacters(request: HomeViewControllerModels.FetchCharacterData.Request) {
            var charactersCalled = true
        }
    }
    
    func testDisplaySearchData() {
        let char = Mock.CharacterMock().venom
        let viewModel = HomeViewControllerModels.FetchData.ViewModel(displayedCharacters: [char])
        
        loadView()
        sut.displayFetchedData(viewModel: viewModel)
        
        XCTAssertEqual(sut.tableViewDataSource?.heroData.count, 1, "searchCharacter(viewModel:) should update tableDataSource with Venom character")
        XCTAssertEqual(sut.tableViewDataSource?.heroData[0].id, char.id, "TableDataSource should have Venom in the first place")
    }
    
    func testDisplayCharacter() {
        let char = Mock.CharacterMock().venom
        let viewModel = HomeViewControllerModels.FetchCharacterData.ViewModel(displayedCharacters: [char])

        loadView()
        sut.displayFetchedHeroesData(viewModel: viewModel)
        
        XCTAssertEqual(sut.tableViewDataSource?.heroData.count, 1, "searchCharacter(viewModel:) should update tableDataSource with Venom character")
        XCTAssertEqual(sut.tableViewDataSource?.heroData[0].id, char.id, "TableDataSource should have Venom in the first place")
    }

}
