//
//  Episode.swift
//  testJSON
//
//  Created by Yodfha on 8/15/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import Foundation

class Episode
{
    var title: String?
    var description: String?
    var thumbnailURL: NSURL?
    var createdAt: String?
    var author: String?
    var orderbymix: String?
    var url: NSURL?
    var drug: String?
    var pattern: String?
    var properties: String?
    var usage: String?
    var warning: String?
    var keep: String?
    var company: String?
    var effect: String?
    var price1: String?
    var price2: String?
    var barcode: String?
    var testCode: String?
    var orderbygroup: String?
    var orderbysystem: String?
    var orderbylaw: String?
    
    init(title: String, description: String, thumbnailURL: NSURL, createdAt: String, author: String, orderbymix: String, drug: String, pattern: String, properties: String, usage: String, warning: String, keep: String, company: String, effect: String, price1: String, price2: String, barcode: String, testCode: String, orderbygroup: String, orderbysystem: String, orderbylaw: String)
    {
        self.title = title
        self.description = description
        self.thumbnailURL = thumbnailURL
        self.createdAt = createdAt
        self.author = author
        self.orderbymix = orderbymix
        self.drug = drug
        self.pattern = pattern
        self.properties = properties
        self.usage = usage
        self.warning = warning
        self.keep = keep
        self.company = company
        self.effect = effect
        self.price1 = price1
        self.price2 = price2
        self.barcode = barcode
        self.testCode = testCode
        self.orderbygroup = orderbygroup
        self.orderbysystem = orderbysystem
        self.orderbylaw = orderbylaw
    }
    
    typealias EpisodeDictionary = [String : AnyObject]
    
    init(espDictionary: EpisodeDictionary)
    {
        self.title = espDictionary["title"] as? String
        self.description = espDictionary["description"] as? String
        self.thumbnailURL = NSURL(string: espDictionary["thumbnailURL"] as! String)
        self.createdAt = espDictionary["pubDate"] as? String
        self.author = espDictionary["author"] as? String
        self.orderbymix = espDictionary["orderbymix"] as? String
        //self.url = NSURL(string: espDictionary["link"] as! String)
        self.drug = espDictionary["drug"] as? String
        self.pattern = espDictionary["pattern"] as? String
        self.properties = espDictionary["properties"] as? String
        self.usage = espDictionary["usage"] as? String
        self.warning = espDictionary["warning"] as? String
        self.keep = espDictionary["keep"] as? String
        self.company = espDictionary["company"] as? String
        self.effect = espDictionary["effect"] as? String
        self.price1 = espDictionary["price1"] as? String
        self.price2 = espDictionary["price2"] as? String
        self.barcode = espDictionary["barcode"] as? String
        self.testCode = espDictionary["testCode"] as? String
        self.orderbygroup = espDictionary["orderbygroup"] as? String
        self.orderbysystem = espDictionary["orderbysystem"] as? String
        self.orderbylaw = espDictionary["orderbylaw"] as? String
        
    }
    
    static func downloadAllEpisodes() -> [Episode]
    {
        var episodes = [Episode]()
        
        let jsonFile = NSBundle.mainBundle().pathForResource("rxscanJson3", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonFile!)
        if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
            let espDictionaries = jsonDictionary["episodes"] as! [EpisodeDictionary]
            for dict in espDictionaries {
                let episode = Episode(espDictionary: dict)
                episodes.append(episode)
            }
        }
        
        return episodes
    }
    
    
}
