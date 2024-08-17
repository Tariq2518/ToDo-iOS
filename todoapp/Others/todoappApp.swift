//
//  todoappApp.swift
//  todoapp
//
//  Created by Tariq Hussain on 11/08/2024.
//

import SwiftUI
import FirebaseCore

@main
struct todoappApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                
        }
            
    }
}
