//
//  HeroesTableViewCell.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/21/21.
//

import UIKit
import Kingfisher

protocol FavoriteDelegate: class {
    func setFavorite(sender: HeroesTableViewCell)
}

class HeroesTableViewCell: UITableViewCell {
    
    var viewController: HomeViewController?
    var isFavorited: Bool = false
    
//    let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
    
    @IBOutlet weak var favoriteHeroButton: UIButton!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    weak var delegate: FavoriteDelegate?
    
    var heroesData: Character! {
        didSet {
            self.fillCell(withData: heroesData)
        }
    }
        
    func fillCell(withData data: Character) {
        guard let thumbnail = data.thumbnail else { return }
        guard let url = MarvelServices.getImageURL(downloadURL: thumbnail.path, extension: thumbnail.thumbnailExtension) else { return }
        let resource = ImageResource(downloadURL: url)
        self.heroImageView.setImage(with: resource, activateLoader: true)
        self.heroNameLabel.text = data.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        
        heroImageView.layer.borderWidth = 1.0
        heroImageView.layer.masksToBounds = false
        heroImageView.layer.borderColor = UIColor.white.cgColor
        heroImageView.layer.cornerRadius = heroImageView.frame.size.width / 2
        heroImageView.clipsToBounds = true
        favoriteHeroButton.tintColor = .white

    }
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        delegate?.setFavorite(sender: self)
        
        if sender.isSelected {
            sender.isSelected = false
            favoriteHeroButton.tintColor = .white
            favoriteHeroButton.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            sender.isSelected = true
            favoriteHeroButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favoriteHeroButton.tintColor = .yellow

        }
                
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.heroImageView.kf.cancelDownloadTask()
        self.heroImageView.image = nil
        favoriteHeroButton.tintColor = .white
        favoriteHeroButton.setImage(UIImage(systemName: "star"), for: .normal)
        super.prepareForReuse()

    }
    
}
