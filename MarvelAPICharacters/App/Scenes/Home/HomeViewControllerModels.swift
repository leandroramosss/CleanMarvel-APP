//
//  HomeViewControllerModels.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation

enum HomeViewControllerModels {
    enum FetchData {
        
        struct Request {
            var characterToSearch: String
        }
        
        struct Response {
            var character: [Character]
        }
        struct ViewModel {
            var displayedCharacters: [Character]
        }
    }
    
    enum FetchCharacterData {
        
        struct Request {
            
        }
        
        struct Response {
            var characters: [Character]
        }
        
        struct ViewModel {
            var displayedCharacters: [Character]
        }
    }
}
