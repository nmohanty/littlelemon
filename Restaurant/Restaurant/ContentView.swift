//
//  ContentView.swift
//  Restaurant
//
//  Created by namrata mohanty on 1/29/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    /*@ObservedObject var dish:Dish
    init(_ dish: Dish) {
        self.dish = dish
    }*/
    
    var body: some View {
        Onboarding()
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        ContentView(oneDish())
    }
    
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.title = "Hummus"
        dish.price = "10"
        //dish.size = "Extra Large"
        return dish
    }
}*/
