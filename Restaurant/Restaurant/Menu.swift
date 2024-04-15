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
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            VStack {
                ZStack{
                    HStack {
                        //Spacer()
                        Image("littleLemon")
                            .resizable()
                            .frame(width: 150, height: 40, alignment: .center)
                            .padding(EdgeInsets(top: 5, leading: 190, bottom: 0, trailing: 0))
                        
                        Spacer()
                        Image("profile-image-placeholder")
                            .resizable()
                            .cornerRadius(40)
                            .frame(width: 50, height:50, alignment: .trailing)
                            .padding(EdgeInsets(top: 5, leading: 40, bottom: 0, trailing: 80))
                    }//hstack closure
                    
                }//zstack closure
            }//vstack closure
            
           /* Text("LittleLemon")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Chicago")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.headline)
            Text("We are a family owned Mediterranean restaurant focused on tradiitional recipes served with a modern twist.")
                .fontWeight(.medium)
                .font(.callout)*/
            
            VStack{
                Text("LittleLemon")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 32, weight: .light, design: .serif))
                    .font(.largeTitle)
                    .foregroundStyle(Color("CYellow"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Chicago")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 24, weight: .light, design: .serif))
                    .font(.headline)
                    .foregroundStyle(Color(.white))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("We are a family owned Mediterranean restaurant, focused on tradiitional recipes served with a modern twist.")
                        .fontWeight(.medium)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundStyle(Color(.white))
                        .frame(height: 100)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    //.padding(.horizontal, 2)
                        .multilineTextAlignment(.leading)
                    
                    Image("profile-image-placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120, alignment: .trailing)
                        .cornerRadius(15)
                }//Hstack close
                //.frame(height: 100)
                .padding(.vertical, 15)
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.gray)
                    
                    TextField("", text: $searchText)
                    //.frame(width: 300, height: 30, alignment: .center)
                    //.background(Color.gray).opacity(20)
                }
                .padding(.vertical, 5)
                .padding(.horizontal)
                .background(Color.white.opacity(0.9))
                .cornerRadius(8)
            }//vstack 2nd
            .padding(30)
            .background(Color("CGreen"))
                        
            VStack{
                Text("ORDER FOR DELIVERY!")
                    .frame(height: 60)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                LazyHStack{
                    Text("Starters")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(12)
                        .foregroundColor(.black)
                        .background(Color("CGreen").opacity(0.2))
                        .cornerRadius(10)
                    Text("Mains")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(12)
                        .foregroundColor(.black)
                        .background(Color("CGreen").opacity(0.2))
                        .cornerRadius(10)
                    Text("Desserts")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(12)
                        .foregroundColor(.black)
                        .background(Color("CGreen").opacity(0.2))
                        .cornerRadius(10)
                    Text("Drinks")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(12)
                        .foregroundColor(.black)
                        .background(Color("CGreen").opacity(0.2))
                        .cornerRadius(10)
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 30)
            //TextField("Search menu", text: $searchText)
            ScrollView{

                NavigationView {
                    FetchedObjects(
                        predicate: buildPredicate(),
                        sortDescriptors: buildSortDescriptors()) {(dishes: [Dish]) in
                            List {
                                ForEach(dishes, id:\.self) { dish in
                                    HStack{
                                        VStack {
                                            Text(dish.title ?? "title")
                                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            //.padding([.top, .bottom], 7)
                                            //Spacer()
                                            Text(dish.descript ?? "")
                                                .font(.system(size: 14, weight: .medium, design: .monospaced))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("$ \(dish.price ?? "")")
                                                .font(.system(size: 16, weight: .semibold, design: .monospaced))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }//Vstack
                                        .frame(height: 100)
                                        .frame(width: 240, alignment: .leading)
                                        
                                        //Spacer()
                                        AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                            image
                                                .resizable()
                                                //.aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(height: 100)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    }//hstack
                                } //foreach
                            } //list
                            //.searchable(text: $searchText,
                                        //prompt: "search...")
                        }//fetchedobjects loop
                }//nav view
            }//scrollView
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
        }//vstack
        //.padding(20)
        .onAppear() {
            PersistenceController.shared.clear()
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
            //menuItems = fullMenu.menu
            
            self.menuItems = fullMenu.menu
                        
                        self.menuItems.forEach { item in
                            let dish = Dish(context: PersistenceController.shared.container.viewContext)
                            dish.title = item.title
                            dish.id = Int64(item.id)
                            dish.descript = item.descript
                            dish.price = item.price
                            dish.image = item.image
                        }//check data closure
            
            /*menuItems.forEach { item in
                let dish = Dish(context: PersistenceController.shared.container.viewContext)
                dish.id = Int64(item.id)
                dish.title = item.title
                dish.price = item.price
                dish.image = item.image
                dish.descript = item.descript
                dish.category = item.category
            }//check data closure*/
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

