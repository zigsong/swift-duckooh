//
//  MyboxView.swift
//  Myday6
//
//  Created by songji on 2020/12/08.
//

import SwiftUI

struct MyboxView: View {
    var body: some View {
        ZStack {
            Color.viewBackgroundColor().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text("My Box")
        }
        // .navigationBarBackButtonHidden(true)
    }
}

struct MyboxView_Previews: PreviewProvider {
    static var previews: some View {
        MyboxView()
    }
}
