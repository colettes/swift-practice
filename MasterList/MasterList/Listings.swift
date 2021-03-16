//
//  Listings.swift
//  csmit207-MasterList
//
//  Created by Colette Smith on 3/1/21.
//

import Foundation

let listings = [
    Listing(title: "Summer.2020.007",
            imgName: "Summer.2020.007.jpg",
            price: .small),
    
    Listing(title: "2019.032.Untitled",
            imgName: "2019.032.jpg",
            price: .medium),
    
    Listing(title: "2019.023.Untitled",
            imgName: "2019.023.jpg",
            price: .small),
    
    Listing(title: "Summer.2020.004",
            imgName: "Summer.2020.004.jpg",
            price: .extraLarge),
    
    Listing(title: "Summer.2020.003",
            imgName: "Summer.2020.003.jpg",
            price: .small),
    
    Listing(title: "Summer.2020.002",
            imgName: "Summer.2020.002.jpg",
            price: .medium),
    
    Listing(title: "Summer.2020.001",
            imgName: "Summer.2020.001.jpg",
            price: .medium),
    
    Listing(title: "2019.028.Untitled",
            imgName: "2019.028.jpg",
            price: .large),
    
    Listing(title: "2020.001.Untitled",
            imgName: "2020.001.jpg",
            price: .large),
    
    Listing(title: "2019.002.Untitled",
            imgName: "2019.002.jpg",
            price: .extraLarge),
    
    Listing(title: "2019.021.Untitled",
            imgName: "2019.021.jpg",
            price: .small),
    
    Listing(title: "2020.002.Untitled",
            imgName: "2020.002.jpg",
            price: .extraLarge),
]

class Listing {
    
    enum Price: String {
        case small = "12"
        case medium = "16"
        case large = "30"
        case extraLarge = "45"
    }
    
    var title: String
    var imgName: String
    var price: Price
    
    init(title: String, imgName: String, price: Price) {
        self.title = title
        self.imgName = imgName
        self.price = price
    }
}
