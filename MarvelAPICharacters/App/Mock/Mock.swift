//
//  Mock.swift
//  MarvelAPICharacters
//
//  Created by Leandro Ramos on 1/23/21.
//

import Foundation
import Kingfisher

enum Mock {
    struct CharacterMock {
        var venom: Character {
            var char = Character()
            char.name = "Venom (Flash Thompson)"
            char.description = "Flash Thompson was the high school bully of Peter Parker while also being one of Spider-Man's biggest fans. After losing his legs during military service, he became the new Venom, working as an operative of the United States government."
            char.thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/7/80/5269668c7d5df", thumbnailExtension: "jpg")
            char.resourceURI = "http://gateway.marvel.com/v1/public/characters/1009663"
            char.comics = ResourceMock().res
            return char
        }
        var imageResource: ImageResource {
            let imageR = ImageResource(downloadURL: URL(string: (venom.thumbnail?.path)! + "/portrait_xlarge." + (venom.thumbnail?.thumbnailExtension)!)!)
            return imageR
        }
    }

    struct ResourceMock {
        var res: Resources {
            var resource = Resources()
            resource.available = 10
            resource.collectionURI = "http://gateway.marvel.com/v1/public/characters/1009663/comics"
            resource.items = items
            return resource
        }
        private var items: [Item] {
            var item1 = Item()
            item1.name = "Amazing Spider-Man (1999) #574"
            item1.resourceURI = "http://gateway.marvel.com/v1/public/comics/22262"
            item1.thumbnail = nil

            var item2 = Item()
            item2.name = "Amazing Spider-Man (1999) #622"
            item2.resourceURI = "http://gateway.marvel.com/v1/public/comics/28227"
            item2.thumbnail = nil
            return [item1, item2]
        }
    }
}

