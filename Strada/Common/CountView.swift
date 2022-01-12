//
//  CountView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/01.
//

import SwiftUI

struct CountView : View {
    private let range: [String]
    @State private var index: Int = 0
    
    init(count: Int, index: Int = 0) {
        self.range = Array(0...count).map({ String($0) })
        _index = State(initialValue: 0 < index ? index < self.range.count ? index : self.range.count - 1 : 0)
    }
    
    init(range: [String], index: Int = 0) {
        self.range = range
        _index = State(initialValue: 0 < index ? index < self.range.count ? index : self.range.count - 1 : 0)
    }
    
    init(range: [String], valueString: String) {
        self.range = range
        _index = State(initialValue: self.range.firstIndex(of: valueString) ?? 0)
    }
    
    var body: some View {
        HStack {
            Button(action: {
                self.index -= 1
            }) {
                Image(self.index == 0 ? "minus.disable" : "minus")
            }
            .disabled(self.index == 0)
            
            Text("\(self.range[self.index])")
                .font(.system(size: 18))
                .foregroundColor(Color.white)
            
            Button(action: {
                self.index += 1
            }) {
                Image(self.index == self.range.count - 1 ? "plus.disable" : "plus")
            }
            .disabled(self.index == self.range.count - 1)
        }
        .background(Capsule().fill(Color.appBlue))
    }
}

struct CountView_Previews : PreviewProvider {
    static var previews: some View {
        CountView(range: Array(0..<10).map({ "\($0)" }), index: 3)
    }
}
