//
//  MenuItem.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/8/24.
//

import Foundation

struct MenuItem: Decodable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let descript: String
    let category: String
    //let id: Int
    
//    init(from decoder: any Decoder) throws {
//        
//    }
    init() {
        self.id = 0
        self.title = ""
        self.image = ""
        self.price = ""
        self.descript = ""
        self.category = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
        case price = "price"
        case descript = "description"
        case category = "category"
        // add code here
    }
}

/*protocol MenuItemProtocol {
    var id: UUID { get }
    var title: String { get }
    var image: String { get }
    var price: String { get }
    var description: String { get }
    var menuCategory: MenuCategory { get }
   
}

struct MenuItem: Identifiable, MenuItemProtocol, Hashable, Decodable{
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let description: String
    var menuCategory: MenuCategory*/
