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
    
    var body: some View {
        HStack {
            Button(action: {
                indexProxy -= 1
                index = indexProxy
            }) {
                Image(indexProxy == 0 ? "minus.disable" : "minus")
            }
            .disabled(indexProxy == 0)
            
            Text("\(self.range[indexProxy])")
                .font(.system(size: 18))
                .foregroundColor(.white)
            
            Button(action: {
                indexProxy += 1
                index = indexProxy
            }) {
                Image(indexProxy == self.range.count - 1 ? "plus.disable" : "plus")
            }
            .disabled(indexProxy == self.range.count - 1)
        }
        .background(Capsule().fill(Color.appPrimary))
    }
}

struct CountView_Previews : PreviewProvider {
    @State static var index = 10
    
    static var previews: some View {
        CountView(range: Array(0..<10).map({ "\($0)" }), index: $index)
    }
}
