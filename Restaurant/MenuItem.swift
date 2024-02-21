//
//  MenuItem.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/8/24.
//

import Foundation

struct MenuItem: Decodable{
    let id: Int16
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
    //let id: Int
    
    /*enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case price = "price"
        case descript = "descript"
        case category = "category"
        // add code here
    }*/
}
