//
//  SignUpViewViewModel.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignUpViewViewModel : ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func signUp(){
        guard validate() else{
            return
        }
    
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.inserUserData(id: userId)
        }
    }
    
    func inserUserData(id : String){
        
        let newUser = User(
            id: id,
            name: name,
            email: email,
            createdAt: Date().timeIntervalSince1970
        )
        
        let firebaseDB = Firestore.firestore()
         firebaseDB.collection("users")
            .document(id)
            .setData(newUser.asDictionary(), completion: { error in
                print( "MyError:" , error?.localizedDescription)
            })
        
    
            
//        ["id":id,"name": newUser.name, "email": newUser.email, "createdAt": Date().timeIntervalSince1970]
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Email or Password is empty"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Enter valid Email"
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
}
