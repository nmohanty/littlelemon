//
//  Menu.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/6/24.
//

import SwiftUI
import CoreData
import Foundation

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var menuItems = [MenuItem]()
    
    //@ObservedObject var dishesModel = DishesModel()
    @State var searchText: String = ""
    /*@ObservedObject var dish:Dish
    init(_ dish: Dish) {
        self.dish = dish
    }*/
    
    
    var body: some View {
        VStack {
            Text("LittleLemon")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Chicago")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.headline)
            Text("We are a family owned Mediterranean restaurant focused on tradiitional recipes served with a modern twist.")
                .fontWeight(.medium)
                .font(.callout)
            
            //TextField("Search menu", text: $searchText)
            
            NavigationView {
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()) {(dishes: [Dish]) in
                        List {
                            ForEach(dishes) { dish in
                                VStack {
                                    Text(dish.title ?? "")
                                    //.padding([.top, .bottom], 7)
                                    //Spacer()
                                    Text(dish.price ?? "")
                                        .monospaced()
                                        .font(.callout)
                                    
                                    //Text(AsyncImage(url: dish.image))
                                }//hstack
                                //.contentShape(Rectangle())
                            } //foreach
                        } //list
                        .searchable(text: $searchText,
                                    prompt: "search...")
                    }//fetchedobjects loop
            }
        }//vstack
        .padding(20)
        .onAppear() {
            getMenuData()
        }
    }//body
    
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
            menuItems = fullMenu.menu
            
            menuItems.forEach { item in
                let dish = Dish(context: PersistenceController.shared.container.viewContext)
                dish.id = item.id
                dish.title = item.title
                dish.price = item.price
                dish.image = item.image
                //dish.description = item.description
                dish.category = item.category
            }//check data closure
        }//end dataTask closure
        dataTask.resume()
    }//func getdata closure
    
    func buildPredicate() -> NSPredicate {
        if searchText == "" {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "title",
                          ascending: true,
                          selector:
                            #selector(NSString.localizedStandardCompare))]
    }
}
    
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

/*struct Menu_Previews: PreviewProvider {
    Menu()
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        Menu(oneDish())
    }
    
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.title = "Hummus"
        dish.price = "10"
        //dish.size = "Extra Large"
        return dish
    }
}*/

