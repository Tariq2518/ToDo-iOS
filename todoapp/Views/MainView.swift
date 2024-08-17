//
//  ContentView.swift
//  todoapp
//
//  Created by Tariq Hussain on 11/08/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView{
                ToDoListView(userId : viewModel.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }else {
            LoginView()
        }
        
        
        
       
    }
}

#Preview {
    MainView()
}
