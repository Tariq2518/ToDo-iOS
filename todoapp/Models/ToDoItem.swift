//
//  ToDoItem.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import Foundation

struct ToDoItem : Codable, Identifiable {
    let id: String
    let title : String
    let dueDate: TimeInterval
    let createdAt : TimeInterval
    var isCompleted: Bool
    
    
    mutating func setCompleted(_ state: Bool){
        isCompleted = state
    }
}
