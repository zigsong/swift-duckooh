//
//  UserAuth.swift
//  Myday6
//
//  Created by songji on 2020/12/21.
//

import SwiftUI

class UserAuth: ObservableObject {
    @Published var isLoggedin: Bool = false
    
    func login() {
        self.isLoggedin = true
    }
}
