//
//  CountView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/01.
//

import SwiftUI

struct CountView : View {
    private var range: [String]
    @State private var index: Int = 0
    
    init(count: Int, index: Int = 0) {
        range = Array(0...count).map({ String($0) })
        self.index = index
    }
    
    init(range: [String], index: Int = 0) {
        self.range = range
        self.index = index
    }
    
    init(range: [String], valueString: String) {
        self.range = range
        self.index = self.range.firstIndex(of: valueString) ?? 0
    }
    
    var body: some View {
        HStack {
            Button(action: {
                self.index -= 1
            }) {
                Image(index == 0 ? "minus.disable" : "minus")
            }
            .disabled(index == 0)
            
            Text("\(range[index])")
                .font(.system(size: 18))
                .foregroundColor(Color.white)
            
            Button(action: {
                self.index += 1
            }) {
                Image(index == range.count - 1 ? "plus.disable" : "plus")
            }
            .disabled(index == range.count - 1)
        }
        .background(Capsule().fill(Color.appBlue))
    }
}

struct CountView_Previews : PreviewProvider {
    static var previews: some View {
        CountView(range: Array(0..<10).map({ "\($0)" }))
    }
}
