//
//  HistoryView.swift
//  Strada
//
//  Created by 박종봉 on 2022/01/18.
//

import SwiftUI

struct HistoryView : View {
    
    @Binding var isOpenedReceipt: Bool
    
    @StateObject var viewModel = HistoryViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack() {
                CategoryView(categories: viewModel.categories, selected: $viewModel.selectedCategory)
                    .onAppear {
                        viewModel.selectedCategory = viewModel.categories.first ?? ""
                    }
                Spacer()
            }
            .padding(.bottom, 32)
            
            ScrollView {
                ForEach(viewModel.getHistoriesByCategory(category: viewModel.selectedCategory)) { history in
                    HistoryItemView(history: history)
                        .padding(.bottom, 8)
                        .onTapGesture {
                            isOpenedReceipt.toggle()
                        }
                }
            }
        } // VStack
    }
}

struct HistoryView_Previews : PreviewProvider {
    static var previews: some View {
        HistoryView(isOpenedReceipt: .constant(false))
    }
}
