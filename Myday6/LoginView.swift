//
//  LoginView.swift
//  Myday6
//
//  Created by songji on 2020/12/07.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("MyDay6")
                    .font(.system(size: 32, design: .rounded))
                    .foregroundColor(Color.white)
                    .padding()
                // Spacer()
                Image("myday_logo")
                    .padding()
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
