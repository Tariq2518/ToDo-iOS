//
//  ProfileViewViewModel.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel : ObservableObject{
    
    @Published var user: User? = nil
    
    init()  {}
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let firebaseDB = Firestore.firestore()
        
        firebaseDB.collection("users")
            .document(userId)
            .getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data() , error == nil else{
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(id: data["id"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      createdAt: data["createdAt"] as? TimeInterval ?? 0)
                }
                
            }
    }
    
    func logOut(){
        do {
            try Auth.auth().signOut()
        }catch {
            print(error)
        }
    }
}
