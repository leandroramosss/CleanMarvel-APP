//
//  DetailsViewControllerWorkerTests.swift
//  MarvelAPICharactersTests
//
//  Created by Leandro Ramos on 1/24/21.
//

import XCTest
@testable import MarvelAPICharacters

class DetailsViewControllerWorkerTests: XCTestCase {

    var sut: DetailsViewControllerWorker!
    
    override func setUp() {
      super.setUp()
      setupDetailsViewControllerWorker()
    }

    override func tearDown() {
      super.tearDown()
    }

    func setupDetailsViewControllerWorker() {
      sut = DetailsViewControllerWorker()
    }

    func testCollectionsData() {
        let items = Mock.ResourceMock().res.items
        let data = sut.collectionsResponse(item: items)

        XCTAssertNotNil(data)
        XCTAssertNotNil(data.dataSource)
        XCTAssertNotNil(data.delegate)
        XCTAssertNotNil(data.dataSource.resourceData)

    }
    
}
