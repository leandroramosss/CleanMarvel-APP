//
//  Character.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation

struct MarvelServiceResponse<T:Codable>: Codable {
    let status, copyright, attributionText: String?
    let code: Int
    let attributionHTML: String?
    let data: DataClass<T>?
    let etag: String?
}

struct DataClass<T:Codable>: Codable {
    let offset, limit, total, count: Int?
    let results: [T]?
}

struct Character: Codable {
    var id: Int?
    var name: String = ""
    var description: String = ""
    var modified: String = ""
    var thumbnail: Thumbnail?
    var resourceURI: String = ""
    var comics: Resources?
    var series: Resources?
    var stories: Resources?
    var events: Resources?
    var urls: [urlData] = []

    private enum CodingKeys: String, CodingKey {
        case id, name, description, modified, thumbnail, resourceURI, comics, series, stories, events
    }
}

struct Thumbnail: Codable {
    var path: String = ""
    var thumbnailExtension: String = ""

    private enum CodingKeys: String, CodingKey {
        case path = "path"
        case thumbnailExtension = "extension"
    }
}

struct Resources: Codable {
    var available: Int = 0
    var collectionURI: String = ""
    var items: [Item] = []
    var returned: Int = 0
}

struct Item: Codable {
    var resourceURI: String = ""
    var name: String = ""
    var thumbnail: Thumbnail?
}

struct urlData: Codable {
    var type: String = ""
    var url: String = ""
}
