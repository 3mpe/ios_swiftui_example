//
//  RegisterView.swift
//  NativeSimpleProject
//
//  Created by Neyasis on 16.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var pass = ""
    
    var body: some View {
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
                   TextField("Name Surname", text: $email)
               }
               .padding(.all, 20)
               .background(Color.white)
               .cornerRadius(8)
               .padding(.horizontal, 20)
                
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
            
            }
        }
        .background(
            Image("loginBgP")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
