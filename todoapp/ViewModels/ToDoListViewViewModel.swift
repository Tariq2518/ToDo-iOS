//
//  ToDoListViewViewModel.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListViewViewModel : ObservableObject{
    @Published var showingNewItemView = false
    
    init()  {}
    
    func deleteToDoItem(itemId: String){
        
        let firebaseDB = Firestore.firestore()
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        firebaseDB.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemId)
            .delete()
        
    }
}
