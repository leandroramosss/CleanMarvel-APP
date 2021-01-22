//
//  DetailsViewController.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation
import UIKit

protocol DetailsViewControllerDisplayLogic: class {
    
}

class DetailsViewController: UITableViewController {
    
    var interactor: DetailsViewControllerBusinessLogic?
    var router: (NSObjectProtocol & DetailsViewControllerRoutingLogic & DetailsViewControllerDataPassing)
    var selectedCharacter: Character!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = DetailsViewControllerInteractor()
        let presenter = DetailsViewControllerPresenter()
        let router = DetailsViewControllerRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
//            if let router = router, router.responds(to: selector) {
//                router.perform(selector, with: segue)
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension DetailsViewController: DetailsViewControllerDisplayLogic {
    
}
