//
//  CountView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/01.
//

import SwiftUI

struct CountView : View {
    private let range: [String]
    @Binding var index: Int
    
    init(count: Int, index: Binding<Int>) {
        self.range = Array(0...count).map({ String($0) })
        _index = index
    }
    
    init(range: [String], index: Binding<Int>) {
        self.range = range
        _index = index
    }
    
//    init(range: [String], valueString: String) {
//        self.range = range
//        _index = .constant(self.range.firstIndex(of: valueString) ?? 0)
//    }
    
    var body: some View {
        HStack {
            Button(action: {
                index -= 1
            }) {
                Image(index == 0 ? "minus.disable" : "minus")
            }
            .disabled(index == 0)
            
            Text("\(self.range[index])")
                .font(.system(size: 18))
                .foregroundColor(Color.white)
            
            Button(action: {
                index += 1
            }) {
                Image(index == self.range.count - 1 ? "plus.disable" : "plus")
            }
            .disabled(index == self.range.count - 1)
        }
        .background(Capsule().fill(Color.appBlue))
    }
}

struct CountView_Previews : PreviewProvider {
    @State static var index = 3
    
    static var previews: some View {
        CountView(range: Array(0..<10).map({ "\($0)" }), index: $index)
    }
}
