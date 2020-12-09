//
//  MainView.swift
//  Myday6
//
//  Created by songji on 2020/12/08.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "mybox"
    
    var body: some View {
        ZStack {
            CustomTabView(selectedTab: $selectedTab)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct CustomTabView: View {
    @Binding var selectedTab: String

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                ProfileView()
                    .tag("profile")
                BrowseView()
                    .tag("browse")
                MyboxView()
                    .tag("mybox")
                AccountView()
                    .tag("account")
                ChatView()
                    .tag("chat")
            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            
            HStack(spacing: 0) {
                ForEach(defaultTabs, id: \.self) { image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    // equal spacing
                    if image != defaultTabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .edgesIgnoringSafeArea(.all)
//        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

var defaultTabs = ["tab_profile", "tab_browse", "tab_mybox", "tab_account", "tab_chat"]

struct TabButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            let startIdx = image.index(image.startIndex, offsetBy: 4)
            selectedTab = String(image[startIdx...])
        }) {
            Image(image)
                .padding()
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
