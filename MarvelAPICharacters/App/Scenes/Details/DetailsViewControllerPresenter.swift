//
//  DetailsViewControllerPresenter.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation

protocol DetailsViewControllerPresentationLogic {
    func presentCharacter(response: DetailsView.SelectedCharacter.Response)
    func presentComics(request: DetailsView.CollectionViewData.Response)
    func presentSeries(request: DetailsView.CollectionViewData.Response)
    func presentEvents(request: DetailsView.CollectionViewData.Response)
}

class DetailsViewControllerPresenter {
    
    weak var viewController: DetailsViewControllerDisplayLogic?
    
}

extension DetailsViewControllerPresenter: DetailsViewControllerPresentationLogic {
    
    func presentComics(request: DetailsView.CollectionViewData.Response) {
        let viewModel = DetailsView.CollectionViewData.ViewModel(dataSource: request.dataSource, delegate: request.delegate)
        viewController?.requestComics(viewModel: viewModel)
    }
    
    func presentSeries(request: DetailsView.CollectionViewData.Response) {
        let viewModel = DetailsView.CollectionViewData.ViewModel(dataSource: request.dataSource, delegate: request.delegate)
        viewController?.requestSeries(viewModel: viewModel)
    }
    
    func presentEvents(request: DetailsView.CollectionViewData.Response) {
        let viewModel = DetailsView.CollectionViewData.ViewModel(dataSource: request.dataSource, delegate: request.delegate)
        viewController?.requestEvents(viewModel: viewModel)
    }
    
    func presentCharacter(response: DetailsView.SelectedCharacter.Response) {
        let viewModel = DetailsView.SelectedCharacter.ViewModel(name: response.name, thumbnailResource: response.thumbnailResource, description: response.description)
        viewController?.displayedCharacter(viewModel: viewModel)
    }
    
    
    
    
}
