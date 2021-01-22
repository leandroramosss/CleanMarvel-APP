//
//  ResourceCollectionViewCell.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import UIKit
import Kingfisher

class ResourceCollectionViewCell: UICollectionViewCell {
    
    var data: Item! {
        didSet {
            self.fillCell(withData: data)
        }
    }
    
    @IBOutlet var comicImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func fillCell(withData data: Item) {
        HomeViewControllerWorker().getComicThumbnail(url: data.resourceURI) { (comicImage, _) in
            guard let comicImage = comicImage, let url = URL(string: comicImage) else { return }
            let resources = ImageResource(downloadURL: url)
            self.comicImageView.setImage(with: resources, activateLoader: true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        comicImageView.kf.cancelDownloadTask()
        self.comicImageView.image = nil
        super.prepareForReuse()
    }

}
