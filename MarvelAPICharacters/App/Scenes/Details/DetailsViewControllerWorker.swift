//
//  DetailsViewControllerWorker.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation

class DetailsViewControllerWorker {
    
    func collectionsResponse(item: [Item]?) -> DetailsView.CollectionViewData.Response {
        let dataSource = ResourceCollectionDataSource()
        dataSource.resourceData = item?.filter {!$0.resourceURI.contains("image_not_available")}
        let delegate = ResourceCollectionDelegate()
        return DetailsView.CollectionViewData.Response(dataSource: dataSource, delegate: delegate)
    }
    
}
