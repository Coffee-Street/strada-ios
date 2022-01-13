//
//  CurrentViewController.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/13.
//

import SwiftUI

class CurrentViewController : ObservableObject {
    @Published var viewName: String = ""
    
    init(_ initViewName: String) {
        self.viewName = initViewName
    }
    
    func goSign() {
        self.viewName = "Sign"
    }
    
    func goHome() {
        self.viewName = "home"
    }
}
