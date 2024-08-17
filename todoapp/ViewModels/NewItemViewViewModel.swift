//
//  NewItemViewViewModel.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject{
    
    @Published var title = ""
    @Published var dueDate  = Date()
    @Published var showAlert = false
    
    init()  {}
    
    func save(){
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        
        let newToDoItem = ToDoItem(id: newId, 
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdAt: Date().timeIntervalSince1970,
                                   isCompleted: false)
        
        let firestoreDB = Firestore.firestore()
        firestoreDB.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newToDoItem.asDictionary())
        
        
        
    }
    
    var canSave : Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
}
