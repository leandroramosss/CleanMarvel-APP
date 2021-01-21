//
//  HomeViewControllerWorker.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation
import Alamofire
import CryptoSwift

class HomeViewControllerWorker {
    
    private let marvelServices = MarvelServices()
    
    func listAllCharacters(completion: @escaping (_ entity: [Character]?, _ error: Error?) -> Void) {
        marvelServices.getAllCharacters { (characters, error) in
            if let error = error {
                completion(nil, error)
            } else {
                completion(characters, nil)
                print(characters)
            }
        }
    }
    
    func searchHero(string: String, completion: @escaping (_ entity: [Character]?, _ error: Error?) -> Void) {
        marvelServices.searchCharacter(string: string) { (characters, error) in
            if let error = error {
                completion(nil, error)
            } else {
                completion(characters, nil)
                print(characters)
            }
        }
    }
    
    func getComicThumbnail(url: String, completion: @escaping (_ entity: String?, _ error: Error?) -> Void) {
        marvelServices.getComicsData(url: url) { (imageURL, error) in
            if let error = error {
                completion(nil, error)
            } else {
                completion(imageURL, nil)
            }
        }
    }
    
}
