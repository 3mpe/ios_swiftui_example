//
//  RegisterView.swift
//  NativeSimpleProject
//
//  Created by Emre Vatansever on 16.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject private var vmRegister = ViewModelRegister();
    
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
                   TextField("Name Surname", text: $vmRegister.email)
               }
               .padding(.all, 20)
               .background(Color.white)
               .cornerRadius(8)
               .padding(.horizontal, 20)
                
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("Email", text: $vmRegister.email)
                }
                .padding(.all, 20)
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal, 20)
                
                
                HStack {
                  Image(systemName: "lock")
                      .foregroundColor(.gray)
                    SecureField("Password", text: $vmRegister.password)
                }
                .padding(.all, 20)
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal, 20)
                
                
                Button(action: {
                    self.vmRegister.register()
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
