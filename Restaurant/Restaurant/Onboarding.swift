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
let kPhone = "phone no key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @AppStorage("firstName") var firstName: String = ""
    //@AppStorage var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phoneNo: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Image("littleLemon")
                        .resizable()
                        .frame(width: 150, height: 40, alignment: .center)
                        .frame(maxWidth: .infinity, alignment: .center)
                }//zstack closure
                
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
                }//vstack 2nd
                .padding(30)
                .background(Color("CGreen"))
                
                //3rd VStack with form
                VStack {
                    NavigationLink(
                     destination: Home(),
                     isActive: $isLoggedIn,
                     label: {
                     EmptyView()
                     })
                    Form{
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
                        /*TextField("Phone Number", text: $phoneNo)
                         .disableAutocorrection(true)
                         .autocapitalization(.none)*/
                        
                        Button(action: {
                            if firstName.isEmpty == false && lastName.isEmpty == false && email.isEmpty == false {
                                UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                                UserDefaults.standard.setValue(lastName, forKey: kLastName)
                                UserDefaults.standard.setValue(email, forKey: kEmail)
                                UserDefaults.standard.setValue(phoneNo, forKey: kPhone)
                                
                                UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                                self.isLoggedIn = true
                            }
                            
                        }, label: {
                            Text("Register")
                        })//label and button
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    }//form closure
                    .padding(0)
                    .textFieldStyle(.roundedBorder)
                }//3rs vstack closure
            }//vstack closure
            .onAppear(perform: {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) == true {
                    self.isLoggedIn = true
                }
            })//onAppear closure
            .navigationTitle("")
        }//Nav Stack closure
    }//body closure
}//struct closure
            
            //OLD CODE section 2
            /*VStack{
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
            }//vstack 2nd
            .padding(30)
            .background(Color("CGreen"))
            
        //3rd VStack with form
            VStack {
                /*NavigationLink(
                 destination: Home(),
                 isActive: $isLoggedIn,
                 label: {
                 EmptyView()
                 })*/
                Form{
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
                    /*TextField("Phone Number", text: $phoneNo)
                     .disableAutocorrection(true)
                     .autocapitalization(.none)*/
                    
                    Button(action: {
                        if firstName.isEmpty == false && lastName.isEmpty == false && email.isEmpty == false && phoneNo.isEmpty == false {
                            UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                            UserDefaults.standard.setValue(lastName, forKey: kLastName)
                            UserDefaults.standard.setValue(email, forKey: kEmail)
                            UserDefaults.standard.setValue(phoneNo, forKey: kPhone)
                            
                            UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                            self.isLoggedIn = true
                        }
                    }, label: {
                        Text("Register")
                    })//label and button
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }//form closure
                .padding(0)
                .textFieldStyle(.roundedBorder)
                
            }//3rs vstack closure
            .onAppear(perform: {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) == true {
                    self.isLoggedIn = true
                }
            })//onAppear closure
            Button(action: {
                if firstName.isEmpty == false && lastName.isEmpty == false && email.isEmpty == false && phoneNo.isEmpty == false {
                    UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                    UserDefaults.standard.setValue(lastName, forKey: kLastName)
                    UserDefaults.standard.setValue(email, forKey: kEmail)
                    UserDefaults.standard.setValue(phoneNo, forKey: kPhone)
                    
                    UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                    self.isLoggedIn = true
                }
            }, label: {
                Text("Register")
            })//label and button

        }*/
        
        //OLD CODE section 1
       /* NavigationView {
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
                TextField("Phone Number", text: $phoneNo)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                        
            
                Button(action: {
                    if firstName.isEmpty == false && lastName.isEmpty == false && email.isEmpty == false && phoneNo.isEmpty == false {
                        UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                        UserDefaults.standard.setValue(lastName, forKey: kLastName)
                        UserDefaults.standard.setValue(email, forKey: kEmail)
                        UserDefaults.standard.setValue(phoneNo, forKey: kPhone)
                        
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
        
    }*/


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
