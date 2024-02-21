//
//  UserProfile.swift
//  Restaurant
//
//  Created by namrata mohanty on 2/6/24.
//

import SwiftUI


struct UserProfile: View {
    let preName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let postName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let userEmail = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal information")
            Image("profile-image-placeholder")
                //.scaledToFit()
                .opacity(0.2)
            Spacer()
            HStack{
                Text("Name:  \(preName)")
                    .font(.callout)
                Text(postName)
                    .font(.callout)
            }
            Text(userEmail)
            Spacer()
            
            Button(action: {
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Logout")
                
            })
            Spacer()
        }
        .padding(40)
    }
}

#Preview {
    UserProfile()
}
