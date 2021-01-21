//
//  HeroesTableDataSource.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/21/21.
//

import Foundation
import UIKit

class HeroesTableDataSource: NSObject, UITableViewDataSource {
    
    let reuseIdentifier = "HeroTableViewCell"
    let cellNibName = "HeroesTableViewCell"
    
    var heroData: Array<Character> = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nibName = UINib(nibName: cellNibName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: reuseIdentifier)
        
        let cell: HeroesTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HeroesTableViewCell
        cell.heroesData = heroData[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
