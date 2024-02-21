//
//  Home.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/6/24.
//

import SwiftUI

struct Home: View {
    let persistenceController = PersistenceController.shared
    /*@ObservedObject var dish:Dish
    init(_ dish: Dish) {
        self.dish = dish
    }*/
    
    var body: some View {
        TabView {
            Menu()
                //.tag(0)
                .tabItem({ Label ("Menu", systemImage: "list.dash" )
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                })
            UserProfile()
                .tag(1)
                .tabItem({ Label ("Profile", systemImage: "square.and.pencil" )
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                })
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
/*struct Home_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        Home(oneDish())
    }
    
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.title = "Hummus"
        dish.price = "10"
        //dish.size = "Extra Large"
        return dish
    }
}*/
