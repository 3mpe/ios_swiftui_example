//
//  ContentView.swift
//  NativeSimpleProject
//
//  Created by Neyasis on 15.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import SwiftUI
import SwiftyJSON

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
    
    @State var email = ""
    @State var pass = ""
    @State var areYouGoingToSecondView: Bool = true
    
    func UserMe() -> Void {
        print("istek basladi")
        userService.todos(parameters: nil) { (resp) in
            let a = try! JSON(data: resp as! Data)
             
            print(a[0])
        }
    }
    
    
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
                        TextField("Email", text: $email)
                    }
                    .padding(.all, 20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    
                    
                    HStack {
                      Image(systemName: "lock")
                          .foregroundColor(.gray)
                        SecureField("Password", text: $pass)
                    }
                    .padding(.all, 20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    
                    
                    Button(action: {}) {
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)

                    
                  NavigationLink(destination: RegisterView(), isActive: $areYouGoingToSecondView) { EmptyView() }

                  Button(action: {
                        self.areYouGoingToSecondView = true // Step 4
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
                    self.UserMe()
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
