//
//  MainView.swift
//  Myday6
//
//  Created by songji on 2020/12/08.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            CustomTabView()
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct CustomTabView: View {
    @State var selectedTab = "tab_mybox"

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                ProfileView()
                    .tag("tab_profile")
                BrowseView()
                    .tag("tab_browse")
                MyboxView()
                    .tag("tab_mybox")
                AccountView()
                    .tag("tab_account")
                ChatView()
                    .tag("tab_chat")
            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .all)
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
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

var defaultTabs = ["tab_profile", "tab_browse", "tab_mybox", "tab_account", "tab_chat"]

struct TabButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            self.selectedTab = image
        }) {
            if self.selectedTab == image {
                let selectedName = image + "_selected"
                Image(selectedName)
                    .padding()
            } else {
                Image(image)
                    .padding()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
