//
//  DetailsHomeViewControllerTest.swift
//  MarvelAPICharactersTests
//
//  Created by Leandro Ramos on 1/23/21.
//

import XCTest
@testable import MarvelAPICharacters

class DetailsHomeViewControllerTest: XCTestCase {

    var sut: DetailsViewController!
    var window: UIWindow!
    
    override func setUp() {
      super.setUp()
      window = UIWindow()
        setupDetailsViewController()
    }

    override func tearDown() {
      window = nil
      super.tearDown()
    }

    func setupDetailsViewController() {
      let bundle = Bundle.main
      let storyboard = UIStoryboard(name: "Main", bundle: bundle)
      sut = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
    }

    func loadView() {
      sut.selectedCharacter = Mock.CharacterMock().venom
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }

    class DetailsViewControllerBusinessLogicSpy: DetailsViewControllerBusinessLogic {
        var requestCharacterData = false
        var requestComics = false
        var requestSeries = false
        var requestEvents = false
        
        func requestCharacterData(request: DetailsView.SelectedCharacter.Request) {
            requestCharacterData = true
        }
        
        func requestComics(request: DetailsView.CollectionViewData.Request) {
            requestComics = false
        }
        
        func requestSeries(request: DetailsView.CollectionViewData.Request) {
            requestSeries = false
        }
        
        func requestEvents(request: DetailsView.CollectionViewData.Request) {
            requestEvents = false
        }
        
    }
    
    func requestCharacters() {
        let spy = DetailsViewControllerBusinessLogicSpy()
        sut.interactor = spy
        
        loadView()
        
        XCTAssertTrue(spy.requestCharacterData, "viewDidLoad() should ask the interactor to do something")
    }
    
    func testDisplayCharacter() {
        let dataSource = ResourceCollectionDataSource()
        let delegate = ResourceCollectionDelegate()
        let mock = Mock.CharacterMock()
        let venom = mock.venom
        
        let viewModel = DetailsView.SelectedCharacter.ViewModel(name: venom.name, thumbnailResource: mock.imageResource, description: venom.description)
        
        loadView()
        sut.displayedCharacter(viewModel: viewModel)
        XCTAssertEqual(sut.heroNameLabel.text, venom.name, "displaySomething(viewModel:) should update the name text field")
    }
            
}
