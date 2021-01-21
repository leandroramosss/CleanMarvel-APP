//
//  MarvelServices.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation
import Kingfisher
import Alamofire
import CryptoSwift

fileprivate enum URLType: String {
    case image = "?"
    case `default` = "&"
}

private let protaitImage = "/portrait_xlarge."
private let landscapeImage = "/landscape_large."

final class MarvelServices {
    
    var baseURL = "https://gateway.marvel.com:443/v1/public/"
    var publicKey = "32021cf0bf6ee6b53ae1e1d1dd932f54"
    var privateKey = "b5885e6f446f34b6870729042d04a16474f51a62"
    
    private lazy var urlConfiguration: String = {
        return "%@ts=%@&apikey=\(self.publicKey)&hash=%@"
    }()
    
    private lazy var apiConfiguration: String = {
        let ts = NSDate().timeIntervalSince1970.description
        let md5String: String = ts+privateKey+publicKey
        return String(format: urlConfiguration, "&", ts, md5String.md5())
    }()
    
    private func getLink(url: String, urlType: URLType) -> String {
        let ts = NSDate().timeIntervalSince1970.description
        let mdFiveString: String = ts+privateKey+publicKey
        return String.init(format: url + urlConfiguration, urlType.rawValue, ts, mdFiveString.md5())
    }
    
    
    
    func searchCharacter(string: String, completion: @escaping (_ entity: [Character]?, _ error: Error?) -> Void) {
        let url = getLink(url: baseURL+"characters?nameStartsWith=\(string)&orderBy=name", urlType: .default)
        print(url)
        request(with: url, type: MarvelServiceResponse<Character>.self) { (result, _ ) in
            return completion(result?.data?.results, nil)

        }
    }
    
    func getAllCharacters(completion: @escaping (_ entity: [Character]?, _ error: Error?) -> Void) {
        let url = getLink(url: baseURL+"characters?&limit=100&offset=0", urlType: .default)
        print(url)
        request(with: url, type: MarvelServiceResponse<Character>.self) { (result, _ ) in
            return completion(result?.data?.results, nil)
        }
    }
    
    func getComicsData(url: String, completion: @escaping (_ entity: String?, _ error: Error?) -> Void) {
        let url = getLink(url: url, urlType: .image)
        request(with: url, type: MarvelServiceResponse<Comic>.self) { (result, _) in
            guard let data = result?.data, let thumbnail = data.results![0].thumbnail else { return }
            let imageUrl = thumbnail.path + landscapeImage + thumbnail.thumbnailExtension
            return completion(imageUrl, nil)
        }
    }
    
    private func request<T: Codable>(with url: String, type: T.Type, completion: @escaping (_ result: T?, _ reeoe: Error?) -> Void) {
        Alamofire.request(url).responseData { (response) in
            switch response.result {
                case .success:
                    if let jsonData = response.result.value {
                        do {
                            let decoder = JSONDecoder()
                            let product = try decoder.decode(T.self, from: jsonData)
                            return completion(product, nil)
                        } catch let error {
                            print(error)
                        }
                    }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    static func getImageURL(downloadURL: String, extension: String) -> URL? {
        let path = downloadURL + protaitImage + `extension`
        guard let url = URL(string: path) else { return nil }
        return url
    }

}
