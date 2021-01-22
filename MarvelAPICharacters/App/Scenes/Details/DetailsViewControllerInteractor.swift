//
//  DetailsViewControllerInteractor.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation

protocol DetailsViewControllerBusinessLogic {
    
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
    
}
