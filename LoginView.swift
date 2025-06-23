//
//  LoginView.swift
//  HeadShot
//
//  Created by Chris Chuah on 6/16/25.
//

import SwiftUI


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 30) {
                Text("Welcome to HeadShot")
                    .font(.system(size: 25, weight: .bold))
                    .navigationBarTitleDisplayMode(.inline)
                    

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)

                ZStack(alignment: .trailing) {
                    Group {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }

                Button(action: {
                    // Login logic here
                }) {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.horizontal, 40)

            Spacer()
        }
    }
}

struct LoginScreenView: View {
    var body: some View {
        ZStack {
            GradientView() // animated background
                .ignoresSafeArea()
            LoginView()    // white login box
        }
        .ignoresSafeArea()
    }
}
