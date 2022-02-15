//
//  CountView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/01.
//

import SwiftUI

struct CountView : View {
    @Binding var index: Int
    
    @State private var indexProxy: Int
    
    private let range: [String]
    
    init(count: Int, index: Binding<Int>) {
        _index = index
        
        self.range = Array(0...count).map({ String($0) })
        
        _indexProxy = State(initialValue: 0 <= index.wrappedValue ? index.wrappedValue < self.range.count ? index.wrappedValue : self.range.count - 1 : 0)
    }
    
    init(range: [String], index: Binding<Int>) {
        _index = index
        
        self.range = range
        
        _indexProxy = State(initialValue: 0 <= index.wrappedValue ? index.wrappedValue < self.range.count ? index.wrappedValue : self.range.count - 1 : 0)
    }
    
//    init(range: [String], valueString: String) {
//        self.range = range
//        _index = .constant(self.range.firstIndex(of: valueString) ?? 0)
//    }
    
    func up() {
        indexProxy += 1
        index = indexProxy
    }
    
    func down() {
        indexProxy -= 1
        index = indexProxy
    }
    
    var body: some View {
        HStack {
            Button(action: {
                down()
            }) {
                Image(indexProxy == 0 ? "minus.disable" : "minus")
            }
            .disabled(indexProxy == 0)
            
            Text("\(self.range[indexProxy])")
                .font(.system(size: 18))
                .foregroundColor(Color.white)
            
            Button(action: {
                up()
            }) {
                Image(indexProxy == self.range.count - 1 ? "plus.disable" : "plus")
            }
            .disabled(indexProxy == self.range.count - 1)
        }
        .background(Capsule().fill(Color.appBlue))
    }
}

struct CountView_Previews : PreviewProvider {
    @State static var index = 10
    
    static var previews: some View {
        CountView(range: Array(0..<10).map({ "\($0)" }), index: $index)
    }
}
