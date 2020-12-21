//
//  MyboxView.swift
//  Myday6
//
//  Created by songji on 2020/12/08.
//

import SwiftUI
import CoreData

struct MyboxView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Category.getAllCategories()) var categories: FetchedResults<Category>
    @State private var showAddCategoryAlert = false
    @State private var newCategoryName = ""
    
//    func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
//        AlertViewController(isPresented: isPresented, alert: alert, content: self)
//    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.viewBackgroundColor()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            print("add category")
                            self.showAddCategoryAlert = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                                .padding()
                        }
                        .frame(alignment: .topTrailing)
                        
        //                .alert(isPresented: self.$showAddCategoryAlert) {
        //                    Alert(title: Text("Add Category"), message: Text("type new category name"), primaryButton: .destructive(Text("Primary"), action: {
        //
        //                    }), secondaryButton: .cancel())
        //                }
                    }
                    
                    if self.showAddCategoryAlert {
                        AlertViewController(textString: $newCategoryName,
                                            showAlert: $showAddCategoryAlert,
                                            title: "Add new Category",
                                            message: "type new category name")
                    }
                    
                    VStack {
                        VStack {
                            Text("Mybox")
                                .font(Font.custom("PTSans-Bold", size: 32))
                                .foregroundColor(Color.white)
                                .padding(.top, 16)
                            
                            Text("mybox에서 내 영상 찜 콕콕")
                                .font(Font.custom("PTSans-Regular", size: 16))
                                .foregroundColor(Color.white)
                                .padding(.top, 4)
                                .padding(.bottom, 12)
                        }
                        
                        // Spacer()
                    
                        ScrollView(.vertical) {
                            ForEach(categories) { category in
                                PreviewList(category: category.name ?? "Unknown")
                            }
                        }
                    }
                    
                    Spacer()
                }
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
                NavigationLink(destination: CategoryView(categoryName: category)) {
                    Image(systemName: "arrow.forward.circle")
                }
                .padding(.top, 14)
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
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct MyboxView_Previews: PreviewProvider {
    static var previews: some View {
        MyboxView()
    }
}
