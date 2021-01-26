//
//  HeroesTableDelegate.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/21/21.
//

import Foundation
import UIKit

class HeroesTableDelegate: NSObject, UITableViewDelegate {
        
    private var selectionCallback: ((IndexPath) -> Void)?
    var selectedIndexArray:[Int] = []
    
    func selectionItemAtIndex(callback: @escaping (IndexPath) -> Void) {
        selectionCallback = callback
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        if let callback = selectionCallback {
            callback(indexPath)
        }
    }
    
}

extension HeroesTableDelegate: FavoriteDelegate {
    
    func setFavorite(sender: HeroesTableViewCell) {
        print("pass in delegate")
    }
}
