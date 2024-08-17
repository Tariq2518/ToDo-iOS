//
//  LoginView.swift
//  todoapp
//
//  Created by Tariq Hussain on 12/08/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    backgroundColor: .pink,
                    rotationAngle: 15
                )
                
               
                
                //Login Form
                Form{
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Login",
                         backgroundColor: .blue){
                             viewModel.login()
                         }
                         .padding()
                }
                .offset(y: -80)
                
                VStack{
                    Text("New here ?")
                    NavigationLink("Create Account"){
                        SignUpView()
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct HeaderView:View {
    let title : String
    let subtitle : String
    let backgroundColor : Color
    let rotationAngle : Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: rotationAngle))
            
            VStack{
                Text(LocalizedStringKey(title))
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(LocalizedStringKey(subtitle))
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
                height: 350)
        .offset(y: -150)
    }
}

struct TLButton : View {
    
    let title : String
    let backgroundColor : Color
    let action : () -> Void
    
    
    var body: some View {
        Button(
            action: {
                //login
                action()
            },
            label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(backgroundColor)
                    Text(LocalizedStringKey(title))
                        .foregroundColor(.white)
                        .bold()
                    
                }
        })
        
    }
}

#Preview {
    LoginView()
}
