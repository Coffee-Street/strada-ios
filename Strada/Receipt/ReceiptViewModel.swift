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
    
    func getTotalPrice() -> Int {
        return 0
    }
    
    func getReceptionStatus() -> String {
        switch receipt.status {
        case ReceiptStatus.ACCEPT_WAIT:
            return "대기"
        case ReceiptStatus.UNACCEPTED:
            return "취소"
        default:
            return "완료"
        }
    }
    
    func getManufactureStatus() -> String {
        switch receipt.status {
        case ReceiptStatus.ACCEPT_WAIT: fallthrough
        case ReceiptStatus.UNACCEPTED:
            return "-"
        case ReceiptStatus.MANUFACTURE_WAIT:
            return "대기"
        case ReceiptStatus.MANUFACTURING:
            return "진행"
        case ReceiptStatus.PICK_UP_WAIT: fallthrough
        case ReceiptStatus.PICKED_UP:
            return "완료"
        }
    }
    
    func getPickUpStatus() -> String {
        switch receipt.status {
        case ReceiptStatus.PICK_UP_WAIT:
            return "대기"
        case ReceiptStatus.PICKED_UP:
            return "완료"
        default:
            return "-"
        }
    }
    
    func getReceiptionDate() -> String {
        return getDateFormatter().string(from: receipt.createdAt)
    }
    
    func getManufactureDate() -> String {
        switch receipt.status {
        case ReceiptStatus.ACCEPT_WAIT: fallthrough
        case ReceiptStatus.UNACCEPTED:
            return "-"
        default:
            return getDateFormatter().string(from: receipt.respondTo)
        }
    }
    
    func getPickUpDate() -> String {
        switch receipt.status {
        case ReceiptStatus.PICK_UP_WAIT: fallthrough
        case ReceiptStatus.PICKED_UP:
            return getDateFormatter().string(from: receipt.doneOn)
        default:
            return "-"
        }
    }
    
    func getDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd hh:mm"
        
        return dateFormatter
    }
}
