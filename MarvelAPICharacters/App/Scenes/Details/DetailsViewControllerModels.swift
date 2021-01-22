//
//  DetailsViewControllerModels.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation
import Kingfisher

enum DetailsView {
    
    enum SelectedCharacter {
        
        struct Request {
            
            var character: Character
            
        }
        
        struct Response {
            
            var name: String
            var thumbnailResource: ImageResource
            var description: String
            
        }
        
        struct ViewModel {
            
            var name: String
            var thumbnailResource: ImageResource
            var description: String?
            
        }
        
    }
    
    enum CollectionViewData {
        
        struct Request {
            
            var items: [Item]?
            
        }
        
        struct Response {
            
            var dataSource: ResourceCollectionDataSource
            var delegate: ResourceCollectionDelegate

        }
        
        struct ViewModel {
            
            var dataSource: ResourceCollectionDataSource
            var delegate: ResourceCollectionDelegate
            
        }
        
    }
    
}
