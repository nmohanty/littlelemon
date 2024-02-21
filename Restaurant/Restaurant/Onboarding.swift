//
//  Onboarding.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/3/24.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext
    /*@ObservedObject var dish:Dish
    init(_ dish: Dish) {
        self.dish = dish
    }*/
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(
                    destination: Home(),
                    isActive: $isLoggedIn,
                    label: {
                        EmptyView()
                    })
                
                TextField("First Name", text: $firstName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField("Last Name", text: $lastName)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    /*.onChange(of: email) { value in
                        if value.validateValue(<#T##Any#>, forKey: kEmail) == true {
                            self.isLoggedIn = false
                        }else {
                            self.isLoggedIn = true
                        }*/
                        
            
                Button(action: {
                    if firstName.isEmpty == false && lastName.isEmpty == false && email.isEmpty == false {
                        UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                        UserDefaults.standard.setValue(lastName, forKey: kLastName)
                        UserDefaults.standard.setValue(email, forKey: kEmail)
                        
                        UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                        self.isLoggedIn = true
                    }
                }, label: {
                    Text("Register")
                })
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .onAppear(perform: {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) == true {
                    self.isLoggedIn = true
                }
            })
            
        }
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

/*struct Onboarding_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        Onboarding(oneDish())
    }
    
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.title = "Hummus"
        dish.price = "10"
        //dish.size = "Extra Large"
        return dish
    }
}*/
