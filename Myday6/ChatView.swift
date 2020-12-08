//
//  ChatView.swift
//  Myday6
//
//  Created by songji on 2020/12/08.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack {
            Color.viewBackgroundColor().edgesIgnoringSafeArea(.all)
            Text("Chat View")
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
