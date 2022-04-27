//
//  PaymentViewModel.swift
//  Strada
//
//  Created by 박종봉 on 2022/02/14.
//

import Foundation

class PaymentViewModel : ObservableObject {
    @Published var usePoint: Int = 0
    @Published var availablePoint: Int = 0
    
    @Published var paymentItemViewModels: [PaymentItemViewModel] = [
        PaymentItemViewModel(
            orderItem: OrderItem(
                menu: Menu(
                    type: MenuType.COFFEE,
                    state: MenuState.AVAILABLE,
                    name: MenuName(
                        kr: "아메리카노",
                        en: "Americano"
                    ),
                    price: 4000
                ),
                menuOption: DrinkMenuOption(
                    menuType: .COFFEE,
                    temperatureType: MenuTemperatureType.COLD,
                    cupSizeType: MenuCupSizeType.GRANDE,
                    cupType: MenuCupType.DISPOSBLE
                ),
                menuPersonalOption: DrinkMenuPersonalOption(
                    menuType: .COFFEE,
                    shotCount: 1,
                    syrupCount: ["헤이즐넛": 1],
                    iceCount: 2,
                    milkCount: 0,
                    whippedCreamCount: 0,
                    drizzleCount: 0
                ),
                count: 1
            ),
            count: 1
        ),
        PaymentItemViewModel(
            orderItem: OrderItem(
                menu: Menu(
                    type: MenuType.COFFEE,
                    state: MenuState.AVAILABLE,
                    name: MenuName(
                        kr: "아메리카노",
                        en: "Americano"
                    ),
                    price: 4000
                ),
                menuOption: DrinkMenuOption(
                    menuType: .COFFEE,
                    temperatureType: MenuTemperatureType.COLD,
                    cupSizeType: MenuCupSizeType.GRANDE,
                    cupType: MenuCupType.DISPOSBLE
                ),
                menuPersonalOption: DrinkMenuPersonalOption(
                    menuType: .COFFEE,
                    shotCount: 1,
                    syrupCount: ["헤이즐넛": 1],
                    iceCount: 2,
                    milkCount: 0,
                    whippedCreamCount: 0,
                    drizzleCount: 0
                ),
                count: 1
            ),
            count: 1
        ),
    ]
    
    private var api = PaymentAPI()
    private var kakaoAPI = KakaoPayAPI()
    
    func getTotalCount() -> Int {
        return paymentItemViewModels.map { $0.count }.reduce(0, +)
    }
    
    func getTotalPrice() -> Int {
        return paymentItemViewModels.map { ( $0.orderItem.menu.price + 0 ) * $0.count }.reduce(0, +)
    }
    
    func kakaoPayQuery() {
        kakaoAPI.query() { result in
            switch(result) {
            case .success(let query):
                DispatchQueue.main.async {
                    print("success kakaopay query, \(query)")
                }
            case .failure(let error):
                switch(error) {
                case .none:
                    print("에러가 발생하지 않았습니다.")
                case .invalidURL: fallthrough
                case .invalidRequest: fallthrough
                case .invalidResponse: fallthrough
                case .invalidResponseData: fallthrough
                case .decodingFailed: fallthrough
                default:
                    print("query 할 수 없습니다. \(error)")
                }
            }
        }
    }
    
    func kakaoPayReady(callback: @escaping (KakaoPayReady) -> Void) {
        kakaoAPI.ready() { result in
            switch(result) {
            case .success(let ready):
                DispatchQueue.main.async {
                    callback(ready)
                }
            case .failure(let error):
                switch(error) {
                case .none:
                    print("에러가 발생하지 않았습니다.")
                case .invalidURL: fallthrough
                case .invalidRequest: fallthrough
                case .invalidResponse: fallthrough
                case .invalidResponseData: fallthrough
                case .decodingFailed: fallthrough
                default:
                    print("ready 할 수 없습니다. \(error)")
                }
            }
        }
    }
    
    func kakaoPayApprove(tid: String, pgToken: String) {
        kakaoAPI.approve(tid: tid, pgToken: pgToken) { result in
            switch(result) {
            case .success(let approve):
                DispatchQueue.main.async {
                    print("approve 할 수 있습니다. \(approve)")
                }
            case .failure(let error):
                switch(error) {
                case .none:
                    print("에러가 발생하지 않았습니다.")
                case .invalidURL: fallthrough
                case .invalidRequest: fallthrough
                case .invalidResponse: fallthrough
                case .invalidResponseData: fallthrough
                case .decodingFailed: fallthrough
                default:
                    print("approve 할 수 없습니다. \(error)")
                }
                
            }
            
        }
    }
}
