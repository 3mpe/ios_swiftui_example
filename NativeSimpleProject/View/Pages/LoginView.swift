//
//  ContentView.swift
//  NativeSimpleProject
//
//  Created by Emre Vatansever on 15.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import SwiftUI
import SwiftyJSON
import Combine

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

struct LoginView: View {
    private var userService = UserService()
    @ObservedObject private var vmLogin = ViewModelLogin()
      
    
    var body: some View {
        NavigationView{ // Step 1
            ScrollView {
                Spacer(minLength: 100)
                VStack(spacing: 15) {
                    Spacer()
                    Spacer()
                    Text("İncrement")
                        .font(.system(size: 64, weight: .semibold))
                        .foregroundColor(.white)
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Email", text: $vmLogin.email)
                    }
                    .padding(.all, 20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    
                    
                    HStack {
                      Image(systemName: "lock")
                          .foregroundColor(.gray)
                        SecureField("Password", text: $vmLogin.password)
                    }
                    .padding(.all, 20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    
                    
                    Button(action: {
                        self.vmLogin.login()
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)

                    
                    NavigationLink(destination: TodoList(), isActive: $vmLogin.areYouGoingToSecondView) { EmptyView() }

                  Button(action: {
                        // self.areYouGoingToSecondView == true // Step 4
                    self.vmLogin.areYouGoingToSecondView = true
                        
                    }) {
                        Text("Do Something (Go To Second View)")
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                    }
                }
            }
            .background(
                Image("loginBgP")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .edgesIgnoringSafeArea(.all)
                .onAppear {
                    
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            // LoginView().previewDevice("iPhone 5s")
            LoginView().previewDevice("iPhone 8")
            LoginView().previewDevice("iPhone X")
        }
    }
}
