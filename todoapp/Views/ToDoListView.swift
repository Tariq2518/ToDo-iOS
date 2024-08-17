//
//  ToDoListItemsView.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items : [ToDoItem]
    
    private let userId:String
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.deleteToDoItem(itemId: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    //action
                    viewModel.showingNewItemView  = true
                }
                label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
       
    }
}

#Preview {
    ToDoListView(userId: "I0KWgTW2EBa8Au4XfNVMUdOn4Hn1")
}
