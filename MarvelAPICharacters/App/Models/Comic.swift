//
//  Comic.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/20/21.
//

import Foundation

struct Comic: Codable {
    let id, digitalID: Int?
    let title: String?
    let issueNumber: Double?
    let variantDescription, description, modified, isbn: String?
    let upc, diamondCode, ean, issn: String?
    let format: String?
    let pageCount: Int?
    let textObjects: [TextObject]?
    let resourceURI: String?
    let urls: [URI]?
    let series: Series?
    let dates: [Date]?
    let prices: [Price]?
    let thumbnail: Thumbnail?
    let images: [Thumbnail]?
    let creators: Creators?
    let characters: Characters?
    let stories: Stories?
    let events: Characters?

    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription, description, modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects, resourceURI, urls, series, dates, prices, thumbnail, images, creators, characters, stories, events
    }
}

struct Characters: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [Series]?
    let returned: Int?
}

struct Series: Codable {
    let resourceURI, name: String?
}

struct Creators: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [CreatorsItem]?
    let returned: Int?
}

struct CreatorsItem: Codable {
    let resourceURI, name, role: String?
}

struct Date: Codable {
    let type, date: String?
}

struct Price: Codable {
    let type: String?
    let price: Double?
}

struct Stories: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

struct StoriesItem: Codable {
    let resourceURI, name, type: String?
}

struct TextObject: Codable {
    let type, language, text: String?
}

struct URI: Codable {
    let type, url: String?
}
