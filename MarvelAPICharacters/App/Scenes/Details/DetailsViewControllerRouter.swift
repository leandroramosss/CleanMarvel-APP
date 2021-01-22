//
//  DetailsViewControllerRouter.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation

@objc protocol DetailsViewControllerRoutingLogic {

}

protocol DetailsViewControllerDataPassing {
    
    var dataStore: DetailsViewControllerDataStore? { get }
    
}

class DetailsViewControllerRouter: NSObject, DetailsViewControllerRoutingLogic, DetailsViewControllerDataPassing {
    
    weak var viewController: DetailsViewController?
    var dataStore: DetailsViewControllerDataStore?
    
    
    
    
}
