//
//  BrowseView.swift
//  Myday6
//
//  Created by songji on 2020/12/08.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        ZStack {
            Color.viewBackgroundColor().edgesIgnoringSafeArea(.all)
            Text("Browse View")
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
