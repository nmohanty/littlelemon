//
//  Home.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/6/24.
//

import SwiftUI

struct Home: View {
    let persistenceController = PersistenceController.shared
    
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
