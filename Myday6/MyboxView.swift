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
            Color.viewBackgroundColor()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Mybox")
                    .font(.system(size: 32, design: .rounded))
                    .foregroundColor(Color.white)
                    .padding(.top, 16)
                
                Text("mybox에서 내 영상 찜 콕콕")
                    .font(.system(size: 15, design: .rounded))
                    .foregroundColor(Color.white)
                    .padding(.top, 4)
                    .padding(.bottom, 12)

                
                PreviewList(category: "youtube")
                PreviewList(category: "twitter")
                PreviewList(category: "vlive")
                
                Spacer()
            }
        }
    }
}

struct PreviewList: View {
    var category: String
    
    var body: some View {
        VStack {
            HStack {
                Text(category)
                Spacer()
                Image(systemName: "arrow.forward.circle")
            }
            .foregroundColor(Color.white)
            .font(.system(size: 20))
            .padding(.horizontal, 6)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(Color.white)
                            .frame(width: 150, height: 150, alignment: .center)
                    }
                }
            }
            
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
    }
}

struct MyboxView_Previews: PreviewProvider {
    static var previews: some View {
        MyboxView()
    }
}
