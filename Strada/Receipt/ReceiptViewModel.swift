//
//  ReceiptViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/25.
//

import Foundation

class ReceiptViewModel : ObservableObject
{
    @Published var receipt: Receipt = Receipt(id: "A-99", status: ReceiptStatus.UNACCEPTED, createdAt: Date.now, respondTo: Date.now, doneOn: Date.now, orderItems: [])
    
        
    }
}
