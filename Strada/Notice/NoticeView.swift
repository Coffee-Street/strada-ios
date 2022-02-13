//
//  NoticeView.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/06.
//

import SwiftUI

struct NoticeView : View {
    
    @ObservedObject var controller: CurrentViewController
    
    @Binding var isOpened: Bool
    
    @State private var isOpenedReceipt: Bool = false
    
    @StateObject private var viewModel = NoticeViewModel()

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("알림 센터")
                    .foregroundColor(.appBlue)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom)
                
                CategoryView(categories: viewModel.categories, selected: $viewModel.selectedCategory)
                    .padding(.vertical)
                    .onAppear {
                        viewModel.selectedCategory = viewModel.categories.first ?? ""
                    }
                
                ScrollView {
                    ForEach(viewModel.getNoticesByCagetory(category: viewModel.selectedCategory)) { notice in
                        NoticeItemView(notice: notice)
                            .padding(.bottom)
                            .onTapGesture {
                                isOpenedReceipt.toggle()
                            }
                    }
                }
                .padding(.vertical)
            }
            .padding()
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isOpened = false
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
