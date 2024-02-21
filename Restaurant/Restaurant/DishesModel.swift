//
//  DishesModel.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/16/24.
//

import Foundation
import CoreData

//@MainActor
class DishesModel: ObservableObject {
    
    @Published var menuItems = [MenuItem]()
    
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let menuURL = URL(string: menuAddress)!
        
        let request = URLRequest(url: menuURL)
        
        let urlSession = URLSession.shared
        
        let dataTask = urlSession.dataTask(with: request) {
            data, response, error in
            guard let data = data else{
                print("No data")
                return
            }
            
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            //_ = String(data: data, encoding: .utf8)
            let fullMenu = try! JSONDecoder().decode(MenuList.self, from: data)
            self.menuItems = fullMenu.menu
            
            self.menuItems.forEach { item in
                let dish = Dish(context: PersistenceController.shared.container.viewContext)
                dish.title = item.title
                dish.price = item.price
                dish.image = item.image
            }//check data closure
        }//end dataTask closure
        dataTask.resume()
    }//func getdata closure
}


