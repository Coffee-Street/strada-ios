//
//  NoticeView.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/06.
//

import SwiftUI

struct NoticeView : View {
    @ObservedObject var controller: CurrentViewController
    
    @State private var isOpenedReceipt: Bool = false
    
    @StateObject private var viewModel = NoticeViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text("알림센터")
                    .foregroundColor(.appBlue)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom, 36)
                
                CategoryView(categories: viewModel.categories, selected: $viewModel.selectedCategory)
                    .onAppear {
                        viewModel.selectedCategory = viewModel.categories.first ?? ""
                    }
                    .padding(.bottom, 34)
                
                ScrollView {
                    ForEach(viewModel.getNoticesByCagetory(category: viewModel.selectedCategory)) { notice in
                        NoticeItemView(notice: notice)
                            .padding(.bottom, 8)
                            .onTapGesture {
                                isOpenedReceipt.toggle()
                            }
                    }
                }
                .padding(.trailing, 24)
            }
            .padding(.leading, 24)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 30))
                    }
                }
                Spacer()
            } // VStack
            .padding()
            
            if isOpenedReceipt {
                ReceiptView(controller: controller, isOpened: $isOpenedReceipt)
            }
        } // ZStack
        .background(.white)
    }
}

struct NoticeView_Previews : PreviewProvider {
    static var previews: some View {
        NoticeView(controller: CurrentViewController("notification"), isOpened: .constant(false))
    }
}
