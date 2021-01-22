//
//  ResourceCollectionDataSource.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/22/21.
//

import UIKit

let reuseIdentifier = "resourceCellID"
let cellNibName = "ResourceCollectionViewCell"

class ResourceCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var resourceData: [Item]!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resourceData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nibName = UINib(nibName: cellNibName, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)
        
        let cell: ResourceCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ResourceCollectionViewCell
        cell.data = resourceData[indexPath.row]
        cell.backgroundView?.backgroundColor = UIColor.red
        return cell
    }

}
