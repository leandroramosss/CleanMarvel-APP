//
//  HomeViewController.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import UIKit

protocol HomeViewControllerDisplayLogic: class {
    func displayFetchedData(viewModel: HomeViewControllerModels.FetchData.ViewModel)
    func displayFetchedHeroesData(viewModel: HomeViewControllerModels.FetchCharacterData.ViewModel)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var errorView: RoundBorderView!
    
    var tableViewDataSource: HeroesTableDataSource?
    var tableViewDelegate: HeroesTableDelegate?
    
    fileprivate lazy var dismissLayer: UIButton = {
        let button = UIButton(frame: UIScreen.main.bounds)
        button.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
        return button
    }()
    
    var interactor: HomeViewControllerBusinessLogic?
    var router: (NSObjectProtocol & HomeViewControllerRoutingLogic & HomeViewControllerDataPassing)?
    
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
        let interactor = HomeViewControllerInteractor()
        let presenter = HomeViewControllerPresenter()
        let router = HomeViewControllerRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Marvel App"
        let requests = HomeViewControllerModels.FetchCharacterData.Request()
        interactor?.getAllCharacters(request: requests)
        configureTableView()
        searchBar.delegate = self
        tableView.delegate = self
//        errorView.hide()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
}

extension HomeViewController: HomeViewControllerDisplayLogic {
    func didtapAtFavorite(cell: HeroesTableViewCell) {
        print(cell.heroNameLabel.text!)
        print("in datasource first, and themin controller")
        
        
    }
    
    
    func displayFetchedHeroesData(viewModel: HomeViewControllerModels.FetchCharacterData.ViewModel) {
        tableViewDataSource?.heroData = viewModel.displayedCharacters
        
        if viewModel.displayedCharacters.count == 0 {
//            errorView.show()
        } else {
//            errorView.hide()
        }
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        tableView.reloadData()
        
    }
    
    func displayFetchedData(viewModel: HomeViewControllerModels.FetchData.ViewModel) {
        
        tableViewDataSource?.heroData = viewModel.displayedCharacters
        if viewModel.displayedCharacters.count == 0 {
            print("no result show")
        } else {
            print("results hide")
        }
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        tableView.reloadData()
    }
    
    func configureTableView() {
        tableViewDataSource = HeroesTableDataSource()
        tableView.dataSource = tableViewDataSource
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    @objc private func dismissKeyboard() {
        searchBar.endEditing(true)
    }
    
    fileprivate func dismissKeyboardLayer() {
        self.view.addSubview(dismissLayer)
        self.view.bringSubviewToFront(searchBar)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        dismissKeyboardLayer()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        dismissLayer.removeFromSuperview()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text!.trimmingCharacters(in: .whitespaces)
        guard let _ = searchBar.text, searchText.count > 0 else {
            searchBar.text = ""
            dismissKeyboard()
            return
        }
        activityIndicator.startAnimating()
        let request = HomeViewControllerModels.FetchData.Request(characterToSearch: searchText)
        interactor?.serachCharacter(request: request)
        dismissKeyboard()
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.passDataToDetail()
    }
}
