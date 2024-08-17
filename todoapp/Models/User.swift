//
//  User.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import Foundation

struct User: Codable{
    let id: String
    let name : String
    let email : String
    let createdAt : TimeInterval
}
