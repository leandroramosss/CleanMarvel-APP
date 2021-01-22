//
//  DetailsViewControllerPresenter.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation

protocol DetailsViewControllerPresentationLogic {
    func presentCharacter(response: DetailsView.SelectedCharacter.Response)
}

class DetailsViewControllerPresenter {
    
    weak var viewController: DetailsViewControllerDisplayLogic?
    
}

extension DetailsViewControllerPresenter: DetailsViewControllerPresentationLogic {
    
    func presentCharacter(response: DetailsView.SelectedCharacter.Response) {
        let viewModel = DetailsView.SelectedCharacter.ViewModel(name: response.name, thumbnailResource: response.thumbnailResource, description: response.description)
        viewController?.displayedCharacter(viewModel: viewModel)
    }
    
    
    
    
}
