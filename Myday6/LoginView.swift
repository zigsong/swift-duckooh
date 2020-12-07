//
//  LoginView.swift
//  Myday6
//
//  Created by songji on 2020/12/07.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("MyDay Diary")
                    .font(.system(size: 32, design: .rounded))
                    .foregroundColor(Color.white)
                    .padding(.top, 80)
                
                Image("myday_logo")
                    .padding(.top, 60)
                
                // Spacer()
                
                VStack {
                    TextField("Email address", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15.0).fill(Color.white))
                        .frame(width: 320, height: nil)
                        
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15.0).fill(Color.white))
                        .frame(width: 320, height: nil)
                        .padding(.top, 8)
                            
                    Button(action: {
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50.0).fill(Color.white)
                                .frame(width: 320, height: 56, alignment: .center)
                            Text("LOG IN")
                                .foregroundColor(Color.black)
                        }
                    }
                    .padding(.top, 14)
                       
                }
                .padding(.top, 80)
                
                Spacer()
            }
        }
    }
    
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "131D2A"), Color(hex: "57A5B2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
