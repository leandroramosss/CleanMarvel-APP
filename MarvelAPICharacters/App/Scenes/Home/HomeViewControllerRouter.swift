//
//  HomeViewControllerRouter.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation
import UIKit

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
        if let selectedIndexPath = viewController?.tableView.indexPathForSelectedRow {
            if let selectedCharacter = dataStore?.characters![selectedIndexPath.row] {
                let detailsViewController: DetailsViewController = UIStoryboard(storyboard: .Main).instantiateViewController()
                detailsViewController.selectedCharacter = selectedCharacter
                viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
            }
        }
    }
}
