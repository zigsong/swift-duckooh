//
//  AccountView.swift
//  Myday6
//
//  Created by songji on 2020/12/08.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            Color.viewBackgroundColor()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Text("Account View")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
