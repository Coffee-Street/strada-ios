//
//  Color.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/01.
//

import SwiftUI

extension Color {
    
    static let appBlack = Color(hex: "#222222")
  
    static let appBlue = Color(hex: "#0047bb")
    
    static let appLightBlue = Color(hex: "#3270d6")
  
    static let appOrange = Color(hex: "#ff6600")

    static let appBeige = Color(hex: "#d6d2c4")
    
    static let appBrownGray = Color(hex: "#9f9f9f")
    
    static let appLightGray = Color(hex: "#cfcfcf")
    
    static let appVeryLightGray = Color(hex: "#eeeeee")
}

extension Color {

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xff) / 255.0
        let g = Double((rgb >> 8) & 0xff) / 255.0
        let b = Double((rgb >> 0) & 0xff) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
