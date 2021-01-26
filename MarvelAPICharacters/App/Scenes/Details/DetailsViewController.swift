//
//  DetailsViewController.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import Foundation
import UIKit

protocol DetailsViewControllerDisplayLogic: class {
    func displayedCharacter(viewModel: DetailsView.SelectedCharacter.ViewModel)
    func requestComics(viewModel: DetailsView.CollectionViewData.ViewModel)
    func requestSeries(viewModel: DetailsView.CollectionViewData.ViewModel)
    func requestEvents(viewModel: DetailsView.CollectionViewData.ViewModel)
}

class DetailsViewController: UITableViewController {
    var interactor: DetailsViewControllerBusinessLogic?
    var router: (NSObjectProtocol & DetailsViewControllerRoutingLogic & DetailsViewControllerDataPassing)?
    var selectedCharacter: Character!
    
    @IBOutlet var heroImageView: UIImageView!
    @IBOutlet var heroNameLabel: UILabel!
    @IBOutlet var heroInfoLabel: UILabel!
    
    @IBOutlet var comicsCollectionView: UICollectionView!
    @IBOutlet var seriesCollectionView: UICollectionView!
    @IBOutlet var eventsCollectionView: UICollectionView!
    
    @IBOutlet var collectionOfViews: Array<UITableViewCell>?
    @IBOutlet var descriptionCell: UITableViewCell!
    
    var comicDataSource: ResourceCollectionDataSource?
    weak public var comicDelegate: ResourceCollectionDelegate?
    
    var seriesDataSource: ResourceCollectionDataSource?
    weak public var seriesDelegate: ResourceCollectionDelegate?
    
    var eventDataSource: ResourceCollectionDataSource?
    weak var eventDelegate: ResourceCollectionDelegate?
    
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
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        setupCollection()
        interactor?.requestCharacterData(request: DetailsView.SelectedCharacter.Request(character: selectedCharacter))
    }
    
    private func setupCollection() {
        interactor?.requestComics(request: DetailsView.CollectionViewData.Request(items: selectedCharacter.comics?.items))
        interactor?.requestSeries(request: DetailsView.CollectionViewData.Request(items: selectedCharacter.series?.items))
        interactor?.requestEvents(request: DetailsView.CollectionViewData.Request(items: selectedCharacter.events?.items))
    }
    
}

extension DetailsViewController: DetailsViewControllerDisplayLogic {
    
    func requestComics(viewModel: DetailsView.CollectionViewData.ViewModel) {
        comicDataSource = viewModel.dataSource
        comicsCollectionView.delegate = viewModel.delegate
        comicsCollectionView.dataSource = comicDataSource
    }
    
    func requestSeries(viewModel: DetailsView.CollectionViewData.ViewModel) {
        seriesDataSource = viewModel.dataSource
        seriesCollectionView.dataSource = viewModel.dataSource
        seriesCollectionView.delegate = viewModel.delegate
    }
    
    func requestEvents(viewModel: DetailsView.CollectionViewData.ViewModel) {
        eventDataSource = viewModel.dataSource
        eventsCollectionView.delegate = viewModel.delegate
        eventsCollectionView.dataSource = viewModel.dataSource
    }
    
    
    func displayedCharacter(viewModel: DetailsView.SelectedCharacter.ViewModel) {
        self.title = viewModel.name
        self.heroImageView.kf.setImage(with: viewModel.thumbnailResource)
        self.heroNameLabel.text = viewModel.name
        if viewModel.description == "" {
            self.heroInfoLabel.text = "No Description"
            descriptionCell.layer.bounds.size = CGSize(width: descriptionCell.layer.bounds.width, height: 50)
        } else {
            self.heroInfoLabel.text = viewModel.description
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
