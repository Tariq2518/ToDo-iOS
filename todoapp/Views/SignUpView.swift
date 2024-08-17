//
//  SignUpView.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel =  SignUpViewViewModel()
    
    var body: some View {
        VStack{
            //Header
            HeaderView(
                title: "Register",
                subtitle: "Organize your tasks",
                backgroundColor: .yellow,
                rotationAngle: -15
            )
            Form{
                
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                
                TLButton(
                    title: "Register",
                     backgroundColor: .green){
                         viewModel.signUp()
                     }
                     .padding()
            }
            .offset(y: -80)
            
            Spacer()
        }
    }
}

#Preview {
    SignUpView()
}
