//
//  MenuList.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/8/24.
//

import Foundation

struct MenuList: Decodable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
