//
//  HomeViewControllerInteractor.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation

protocol HomeViewControllerBusinessLogic {
    func serachCharacter(request: HomeViewControllerModels.FetchData.Request)
    func getAllCharacters(request: HomeViewControllerModels.FetchCharacterData.Request)
}

protocol HomeViewControllerDataStore {
    var characters: [Character]? { get }
}

class HomeViewControllerInteractor: HomeViewControllerDataStore {
    var presenter: HomeViewControllerPresentationLogic?
    var characters: [Character]?
    var worker: HomeViewControllerWorker?
    
    
}

extension HomeViewControllerInteractor: HomeViewControllerBusinessLogic {
    
    func serachCharacter(request: HomeViewControllerModels.FetchData.Request) {
        worker = HomeViewControllerWorker()
        worker?.searchHero(string: request.characterToSearch, completion: { (result, error) in
            guard error == nil else { return }
            self.characters = result
            guard let chars = self.characters else { return }
            let response = HomeViewControllerModels.FetchData.Response(character: chars)
            self.presenter?.presentSearchResult(response: response)
        })
    }
    
    func getAllCharacters(request: HomeViewControllerModels.FetchCharacterData.Request) {
        worker = HomeViewControllerWorker()
        worker?.listAllCharacters(completion: { (result, error) in
            guard error == nil else { return }
            self.characters = result
            guard let chars = self.characters else { return }
            let response = HomeViewControllerModels.FetchCharacterData.Response(characters: chars)
            self.presenter?.presentListOfHeroes(response: response)
        })
    }
    
}
