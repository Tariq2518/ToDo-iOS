//
//  NewItemView.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding  var newItemPresented : Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 80)
            
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(
                    title: "Save",
                     backgroundColor: .pink){
                         if(viewModel.canSave){
                             viewModel.save()
                             newItemPresented = false
                         }else{
                             viewModel.showAlert = true
                         }
                        
                     }
                     .padding()
                .padding(.all)
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),
                      message: Text( "Please fill all fields correctly"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return false
    }, set: { _ in
        
    }))
}
