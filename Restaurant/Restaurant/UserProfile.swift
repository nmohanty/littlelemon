//
//  UserProfile.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/6/24.
//

import SwiftUI
struct Tasks: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var isChecked: Bool
}


struct UserProfile: View {
    @State var preName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var postName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var userEmail = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var phoneNo = UserDefaults.standard.string(forKey: kPhone) ?? ""
    
    //@State var isLoggedInState = UserDefaults.standard.string(forKey: kIsLoggedIn) ?? ""
    @State var isLoggedIn = true
    
    @State private var multiSelection = Set<UUID>()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var tasks = [
        Tasks(name: "Order Statuses", isChecked: false),
        Tasks(name: "Password changes", isChecked: false),
        Tasks(name: "Special Offers", isChecked: false),
        Tasks(name: "Newsletter", isChecked: false)
    ]
    
    var body: some View {
        ScrollView{
            VStack{
                Section {
                    Text("")
                    Text("Personal information")
                        .font(.headline)
                        .frame(maxHeight: 20, alignment: .leading)
                }
                .padding(5)
                Section {
                    HStack{
                        VStack{
                            Text("Avatar")
                            Image("profile-image-placeholder")
                                .resizable()
                                .cornerRadius(40)
                                .frame(width: 80, height:80, alignment: .leading)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 20))
                        }
                        HStack{
                            Button(action: {
                            }, label: {
                                Text("Change")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.callout)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            })
                            .frame(width: 80, height: 40)
                            .background(Color("CGreen"))
                            
                            Button(action: {
                            }, label: {
                                Text("Remove")
                                    .foregroundColor(.gray)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.callout)
                                    
                            })
                            .frame(width: 80, height: 40)
                            //.cornerRadius(20)
                            .background(Color.white)
                            .border(Color.gray)
                        }//hstack
                    }//hstack nested
                }//section avatar
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(5)
                
                VStack{
                    Section{
                        Text("First name")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        TextField("First Name", text: $preName)
                            .textFieldStyle(.roundedBorder)
                            //.border(Color.gray, width: 1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Section{
                        Text("Last Name")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        TextField("Last Name", text: $postName)
                            .textFieldStyle(.roundedBorder)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Section{
                        Text("Email")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        TextField("Email", text: $userEmail)
                            .textFieldStyle(.roundedBorder)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Section{
                        Text("Phone Number")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        TextField("(217)555-0123", text: $phoneNo)
                            .textFieldStyle(.roundedBorder)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }//1st Vstack
            .padding(20)
            //Spacer()
            
            VStack {
                Text("Email notifications")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(height: 10)
                    .frame(width: 350, alignment: .leading)
                List($tasks) { $task in
                    HStack{
                        Image(systemName: task.isChecked ? "checkmark.square.fill": "square")
                            .onTapGesture {
                                task.isChecked.toggle()
                            }
                        Text(task.name)
                    }
                    //.frame(height: 20, alignment: .leading)
                }//list
                .listRowSeparator(.hidden)
                .listRowSpacing(-10)
                //.listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                .scrollDisabled(true)
                .padding(.vertical, -40)
                .frame(height: 130)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                    UserDefaults.standard.setValue("", forKey: kFirstName)
                    UserDefaults.standard.setValue("", forKey: kLastName)
                    UserDefaults.standard.setValue("", forKey: kEmail)
                    UserDefaults.standard.setValue("", forKey: kPhone)
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Text("Log Out")
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.callout)
                        
                        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                })
                .frame(width: 340, height: 40)
                .background(Color("CYellow"))
                
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Discard Changes")
                            .foregroundColor(.gray)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.callout)
                            .cornerRadius(10)
                            //.border(Color.gray)
                            
                    })
                    .frame(width: 150, height: 40).cornerRadius(10)
                    //.cornerRadius(20)
                    .background(Color.white)
                    .border(Color.gray)
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Save Changes")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.callout)
                            
                    })
                    .frame(width: 150, height: 40)
                    .background(Color("CGreen"))
                }
                //Spacer()
            }//vstack closure
            //.padding(40)
        }//scrollView closure
        .scrollContentBackground(.hidden)
        .overlay(
            ZStack {
                //Color.clear
                   // .background(.ultraThinMaterial)
                HStack {
                    //Spacer()
                    Image("littleLemon")
                        .resizable()
                        .frame(width: 150, height: 40, alignment: .center)
                        .padding(EdgeInsets(top: 5, leading: 190, bottom: 5, trailing: 0))
                    
                    Spacer()
                    Image("profile-image-placeholder")
                    
                        .resizable()
                        .cornerRadius(40)
                        .frame(width: 50, height:50, alignment: .trailing)
                        .padding(EdgeInsets(top: 5, leading: 40, bottom: 5, trailing: 80))
                }//hstack close
            }
                .frame(height: 60)
                .frame(maxHeight: .infinity, alignment: .top)
        )//overlay closure
    }//body closure
}//main struct closure

#Preview {
    UserProfile()
}
