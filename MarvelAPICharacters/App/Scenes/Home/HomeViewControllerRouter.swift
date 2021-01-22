//
//  HomeViewControllerRouter.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation

@objc protocol HomeViewControllerRoutingLogic {
    func passDataToDetail()
}

protocol HomeViewControllerDataPassing {
    var dataStore: HomeViewControllerDataStore? { get }
}

class HomeViewControllerRouter: NSObject, HomeViewControllerRoutingLogic, HomeViewControllerDataPassing {
    
    weak var viewController: HomeViewController?
    var dataStore: HomeViewControllerDataStore?
    
    func passDataToDetail() {
        
    }
    
    
}
