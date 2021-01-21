//
//  HomeViewControllerPresenter.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation

protocol HomeViewControllerPresentationLogic {
    func presentSearchResult(response: HomeViewControllerModels.FetchData.Response)
    func presentListOfHeroes(response: HomeViewControllerModels.FetchCharacterData.Response)
}

class HomeViewControllerPresenter {
    
    weak var viewController: HomeViewControllerDisplayLogic?
    
}

extension HomeViewControllerPresenter: HomeViewControllerPresentationLogic {
    
    func presentListOfHeroes(response: HomeViewControllerModels.FetchCharacterData.Response) {
        let viewModel = HomeViewControllerModels.FetchCharacterData.ViewModel(displayedCharacters: response.characters)
        viewController?.displayFetchedHeroesData(viewModel: viewModel)
    }
    
    func presentSearchResult(response: HomeViewControllerModels.FetchData.Response) {
        let viewModel = HomeViewControllerModels.FetchData.ViewModel(displayedCharacters: response.character)
        viewController?.displayFetchedData(viewModel: viewModel)
    }
    
}
