//
//  DetailsViewControllerInteractor.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation
import Kingfisher

protocol DetailsViewControllerBusinessLogic {
    func requestCharacterData(request: DetailsView.SelectedCharacter.Request)
    func requestComics(request: DetailsView.CollectionViewData.Request)
    func requestSeries(request: DetailsView.CollectionViewData.Request)
    func requestEvents(request: DetailsView.CollectionViewData.Request)
}

protocol DetailsViewControllerDataStore {
    
    var selectedCharacter: Character! { get set }
}

class DetailsViewControllerInteractor: DetailsViewControllerDataStore {
    
    var presenter: DetailsViewControllerPresentationLogic?
    var selectedCharacter: Character!
    
    private lazy var worker: DetailsViewControllerWorker = {
       return DetailsViewControllerWorker()
    }()
    
    
}

extension DetailsViewControllerInteractor: DetailsViewControllerBusinessLogic {
    func requestComics(request: DetailsView.CollectionViewData.Request) {
        guard let items = request.items else { return }
        presenter?.presentComics(request: worker.collectionsResponse(item: items))
    }
    
    func requestSeries(request: DetailsView.CollectionViewData.Request) {
        guard let items = request.items else { return }
        presenter?.presentSeries(request: worker.collectionsResponse(item: items))
    }
    
    func requestEvents(request: DetailsView.CollectionViewData.Request) {
        guard let items = request.items else { return }
        presenter?.presentEvents(request: worker.collectionsResponse(item: items))
    }
    
    
    func requestCharacterData(request: DetailsView.SelectedCharacter.Request) {
        selectedCharacter = request.character
        guard let thumbnail = request.character.thumbnail else { return }
        guard let url = MarvelServices.getImageURL(downloadURL: thumbnail.path, extension: thumbnail.thumbnailExtension) else { return }
        let resource = ImageResource(downloadURL: url)
        let response = DetailsView.SelectedCharacter.Response(name: request.character.name, thumbnailResource: resource, description: request.character.description)
        presenter?.presentCharacter(response: response)
    }
    
}
