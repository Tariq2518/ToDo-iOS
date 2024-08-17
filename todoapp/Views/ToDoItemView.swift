//
//  ToDoItemView.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import SwiftUI

struct ToDoItemView: View {
    let item : ToDoItem
    @StateObject var viewModel = ToDoItemViewViewModel()
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                
            }
            Spacer()
            
            Button {
                viewModel.toggleIsCompleted(item: item)
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            }
            
        }
    }
}

#Preview {
    ToDoItemView(item: .init(id: "123", title: "Test", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isCompleted: true))
}
