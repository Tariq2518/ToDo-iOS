//
//  ProfileView.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    VStack(alignment: .leading){
                        HStack {
                            Text("Name: ")
                            Text(user.name)
                        }
                        .padding(.top, 10)
                        
                        HStack {
                            Text("Email: ")
                            Text(user.email)
                        }
                        .padding(.top, 10)
                        
                        HStack {
                            Text("Member since: ")
                            Text("\(Date(timeIntervalSince1970: user.createdAt).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding(.top, 10)
                        
                    }
                    .padding()
                }else{
                    Text("Loading Profile...")
                }
                
                Button("Logout"){
                    viewModel.logOut()
                }
                
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.red)
                
                
                
            
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
        
       
    }
}

#Preview {
    ProfileView()
}
