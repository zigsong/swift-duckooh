//
//  CategoryView.swift
//  Myday6
//
//  Created by songji on 2020/12/18.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Category.getAllCategories()) var categories: FetchedResults<Category>
    
    var categoryName: String = ""
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.viewBackgroundColor()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                print("delete \(categoryName)")
                
                for category in self.categories {
                    if (category.name! == categoryName) {
                        self.managedObjectContext.delete(category)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                        
                        break;
                    }
                }
            }) {
                
                Image(systemName: "trash")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
            }
        }
        .navigationBarTitle(categoryName)
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

struct CategoryView_Previews: PreviewProvider {
    @State private var categoryName = "category name"
    static var previews: some View {
        CategoryView()
    }
}
