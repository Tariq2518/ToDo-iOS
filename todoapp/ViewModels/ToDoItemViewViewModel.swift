//
//  ToDoItemViewViewModel.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoItemViewViewModel : ObservableObject{
    init()  {}
    
    func toggleIsCompleted(item: ToDoItem){
        var copyItem = item
        
        copyItem.setCompleted(!item.isCompleted)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let firebaseDB = Firestore.firestore()
        
        firebaseDB.collection("users")
            .document(userId)
            .collection("todos")
            .document(copyItem.id)
            .setData(copyItem.asDictionary())
        
    }
}
