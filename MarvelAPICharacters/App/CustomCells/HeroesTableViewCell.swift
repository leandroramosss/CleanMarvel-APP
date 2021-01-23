//
//  HeroesTableViewCell.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/21/21.
//

import UIKit
import Kingfisher

class HeroesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var favoriteHeroButton: UIButton!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
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
        super.prepareForReuse()
    }
    
}
