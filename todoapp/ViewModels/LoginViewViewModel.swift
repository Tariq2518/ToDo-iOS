//
//  LoginViewViewModel.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject {
    
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init(){
        
    }
    
    func login(){
        
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
      
        
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Email or Password is empty"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Enter valid Email"
            return false
        }
        
        return true
    }
    
    
}
