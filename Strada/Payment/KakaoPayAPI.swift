//
//  KakaoPayAPI.swift
//  Strada
//
//  Created by 박종봉 on 2022/04/18.
//

import Foundation

struct KakaoPayAPI {
    
    struct QueryRequest : Encodable {
        let cid: String
        let tid: String
        
        enum CodingKeys: String, CodingKey {
            case cid, tid
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(cid, forKey: .cid)
            try container.encode(tid, forKey: .tid)
        }
    }
    
    struct QueryResponse : Decodable {
        
        struct SelectedCardInfo : Decodable {
            let cardBin: String
            let installMonth: Int
            let cardCorpName: String
            let interestFreeInstall: String
            
            enum CodingKeys: String, CodingKey {
                case card_bin, install_month, card_corp_name, interest_free_install
            }
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                self.cardBin = try container.decode(String.self, forKey: .card_bin).removingPercentEncoding ?? ""
                
                self.installMonth = try container.decode(Int.self, forKey: .install_month)
                
                self.cardCorpName = try container.decode(String.self, forKey: .card_corp_name).removingPercentEncoding ?? ""
                
                self.interestFreeInstall = try container.decode(String.self, forKey: .interest_free_install).removingPercentEncoding ?? ""
            }
        }
        
        struct PaymentActionDetail : Decodable {
            let aid: String
            let approvedAt: Date
            let amount: Int
            let pointAmount: Int
            let discountAmount: Int
            let paymentActionType: String
            let payload: String
            
            enum CodingKeys: String, CodingKey {
                case aid, approved_at, amount, point_amount, discount_amount, payment_action_type, payload
            }
              
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                self.aid = try container.decode(String.self, forKey: .aid).removingPercentEncoding ?? ""
                
                self.amount = try container.decode(Int.self, forKey: .amount)
                
                self.pointAmount = try container.decode(Int.self, forKey: .point_amount)
                
                self.discountAmount = try container.decode(Int.self, forKey: .discount_amount)
                
                self.paymentActionType = try container.decode(String.self, forKey: .payment_action_type).removingPercentEncoding ?? ""
                
                self.payload = try container.decode(String.self, forKey: .payload).removingPercentEncoding ?? ""
                
                let RFC3339DateFormatter = DateFormatter()
                RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
                RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

                let approvedAtString = try container.decode(String.self, forKey: .approved_at)
                  
                self.approvedAt = RFC3339DateFormatter.date(from: approvedAtString) ?? Date()
            }
        }
        
        let tid: String
        let cid: String
        let status: String
        let partnerOrderId: String
        let partnerUserId: String
        let paymentMethodType: String
        let amount: Amount
        let canceledAmount: CanceledAmount
        let canceledAvailableAmount: CanceledAvailableAmount
        let itemName: String
        let itemCode: String
        let quantity: Int
        let createdAt: Date
        let approvedAt: Date
        let canceledAt: Date
        let selectedCardInfo: SelectedCardInfo
        let paymentActionDetails: [PaymentActionDetail]
        
        enum CodingKeys: String, CodingKey {
            case tid, cid, status, partner_order_id, partner_user_id, payment_method_type, amount, canceled_amount, cancel_available_amount, item_name, item_code, quantity, created_at, approved_at, canceled_at, selected_card_info, payment_action_details
        }
          
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.tid = try container.decode(String.self, forKey: .tid).removingPercentEncoding ?? ""
            
            self.cid = try container.decode(String.self, forKey: .cid).removingPercentEncoding ?? ""
            
            self.status = try container.decode(String.self, forKey: .status).removingPercentEncoding ?? ""
            
            self.partnerOrderId = try container.decode(String.self, forKey: .partner_order_id).removingPercentEncoding ?? ""
            
            self.partnerUserId = try container.decode(String.self, forKey: .partner_user_id).removingPercentEncoding ?? ""
            
            self.paymentMethodType = try container.decode(String.self, forKey: .payment_method_type).removingPercentEncoding ?? ""
            
            self.amount = try container.decode(Amount.self, forKey: .amount)
            
            self.canceledAmount = try container.decode(CanceledAmount.self, forKey: .canceled_amount)
            
            self.canceledAvailableAmount = try container.decode(CanceledAvailableAmount.self, forKey: .cancel_available_amount)
            
            self.itemName = try container.decode(String.self, forKey: .item_name).removingPercentEncoding ?? ""
            
            self.itemCode = try container.decode(String.self, forKey: .item_code).removingPercentEncoding ?? ""
            
            self.quantity = try container.decode(Int.self, forKey: .quantity)
            
            let RFC3339DateFormatter = DateFormatter()
            RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
            RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

            let createdAtString = try container.decode(String.self, forKey: .created_at)
              
            self.createdAt = RFC3339DateFormatter.date(from: createdAtString) ?? Date()
            
            let approvedAtString = try container.decode(String.self, forKey: .approved_at)
              
            self.approvedAt = RFC3339DateFormatter.date(from: approvedAtString) ?? Date()
            
            let canceledAtString = try container.decode(String.self, forKey: .canceled_at)
              
            self.canceledAt = RFC3339DateFormatter.date(from: canceledAtString) ?? Date()
            
            self.selectedCardInfo = try container.decode(SelectedCardInfo.self, forKey: .selected_card_info)
            
            self.paymentActionDetails = try container.decode([PaymentActionDetail].self, forKey: .payment_action_details)
        }
    }
    
    struct ReadyRequest : Encodable {
        let cid: String
        let partnerOrderId: String
        let partnerUserId: String
        let itemName: String
        let quantity: Int
        let totalAmount: Int
        let vatAmount: Int
        let taxFreeAmount: Int
        
        let approvalUrl: String
        let failUrl: String
        let cancelUrl: String
        
        enum CodingKeys: String, CodingKey {
            case cid, partner_order_id, partner_user_id, item_name, quantity, total_amount, vat_amount, tax_free_amount, approval_url, fail_url, cancel_url
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(cid, forKey: .cid)
            try container.encode(partnerOrderId, forKey: .partner_order_id)
            try container.encode(partnerUserId, forKey: .partner_user_id)
            try container.encode(itemName.addingPercentEncoding(withAllowedCharacters: .letters), forKey: .item_name)
            try container.encode(quantity, forKey: .quantity)
            try container.encode(totalAmount, forKey: .total_amount)
            try container.encode(vatAmount, forKey: .vat_amount)
            try container.encode(taxFreeAmount, forKey: .tax_free_amount)
            try container.encode(approvalUrl.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), forKey: .approval_url)
            try container.encode(failUrl.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), forKey: .fail_url)
            try container.encode(cancelUrl.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), forKey: .cancel_url)
        }
    }
    
    struct ReadyResponse : Decodable {
        let tid: String
        let redirectAppUrl: String
        let redirectMobileUrl: String
        let redirectPcUrl: String
        let androidAppScheme: String
        let iosAppScheme: String
        let createdAt: Date
        
        enum CodingKeys: String, CodingKey {
            case tid, next_redirect_app_url, next_redirect_mobile_url, next_redirect_pc_url, android_app_scheme, ios_app_scheme, created_at
        }
          
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.tid = try container.decode(String.self, forKey: .tid).removingPercentEncoding ?? ""
            self.redirectAppUrl = try container.decode(String.self, forKey: .next_redirect_app_url).removingPercentEncoding ?? ""
            self.redirectMobileUrl = try container.decode(String.self, forKey: .next_redirect_mobile_url).removingPercentEncoding ?? ""
            self.redirectPcUrl = try container.decode(String.self, forKey: .next_redirect_pc_url).removingPercentEncoding ?? ""
            self.androidAppScheme = try container.decode(String.self, forKey: .android_app_scheme).removingPercentEncoding ?? ""
            self.iosAppScheme = try container.decode(String.self, forKey: .ios_app_scheme).removingPercentEncoding ?? ""
            
            let RFC3339DateFormatter = DateFormatter()
            RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
            RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

            let date_string = try container.decode(String.self, forKey: .created_at)
              
            self.createdAt = RFC3339DateFormatter.date(from: date_string) ?? Date()
        }
    }
    
    struct ApproveRequest : Encodable {
        let cid: String
        let tid: String
        let partnerOrderId: String
        let partnerUserId: String
        let pgToken: String
        
        enum CodingKeys: String, CodingKey {
            case cid, tid, partner_order_id, partner_user_id, pg_token
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(cid, forKey: .cid)
            try container.encode(tid, forKey: .tid)
            try container.encode(partnerOrderId, forKey: .partner_order_id)
            try container.encode(partnerUserId, forKey: .partner_user_id)
            try container.encode(pgToken, forKey: .pg_token)
        }
    }
    
    struct ApproveResponse : Decodable {

        struct CardInfo : Decodable {
            let interestFreeInstall: String
            let bin: String
            let cardType: String
            let cardMid: String
            let approvedId: String
            let installMonth: String
            let purchaseCorp: String
            let purchaseCorpCode: String
            let issuerCorp: String
            let issuerCorpCode: String
            let kakaopayPurchaseCorp: String
            let kakaopayPurchaseCorpCode: String
            let kakaopayIssuerCorp: String
            let kakaopayIssuerCorpCode: String
            
            enum CodingKeys: String, CodingKey {
                case interest_free_install, bin, card_type, card_mid, approved_id, install_month, purchase_corp, purchase_corp_code, issuer_corp, issuer_corp_code, kakaopay_purchase_corp, kakaopay_purchase_corp_code, kakaopay_issuer_corp, kakaopay_issuer_corp_code
            }
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                self.interestFreeInstall = try container.decode(String.self, forKey: .interest_free_install).removingPercentEncoding ?? ""
                
                self.bin = try container.decode(String.self, forKey: .bin).removingPercentEncoding ?? ""
                
                self.cardType = try container.decode(String.self, forKey: .card_type).removingPercentEncoding ?? ""
                
                self.cardMid = try container.decode(String.self, forKey: .card_mid).removingPercentEncoding ?? ""
                
                self.approvedId = try container.decode(String.self, forKey: .approved_id).removingPercentEncoding ?? ""
                
                self.installMonth = try container.decode(String.self, forKey: .install_month).removingPercentEncoding ?? ""
                
                self.purchaseCorp = try container.decode(String.self, forKey: .purchase_corp).removingPercentEncoding ?? ""
                
                self.purchaseCorpCode = try container.decode(String.self, forKey: .purchase_corp_code).removingPercentEncoding ?? ""
                
                self.issuerCorp = try container.decode(String.self, forKey: .issuer_corp).removingPercentEncoding ?? ""
                
                self.issuerCorpCode = try container.decode(String.self, forKey: .issuer_corp_code).removingPercentEncoding ?? ""
                
                self.kakaopayPurchaseCorp = try container.decode(String.self, forKey: .kakaopay_purchase_corp).removingPercentEncoding ?? ""
                
                self.kakaopayPurchaseCorpCode = try container.decode(String.self, forKey: .kakaopay_purchase_corp_code).removingPercentEncoding ?? ""
                
                self.kakaopayIssuerCorp = try container.decode(String.self, forKey: .kakaopay_issuer_corp).removingPercentEncoding ?? ""
                
                self.kakaopayIssuerCorpCode = try container.decode(String.self, forKey: .kakaopay_issuer_corp_code).removingPercentEncoding ?? ""
            }
        }
        
        let aid: String
        let tid: String
        let cid: String
        let partnerOrderId: String
        let partnerUserId: String
        let paymentMethodType: String
        let itemName: String
        let quantity: Int
        
        let amount: Amount
        let cardInfo: CardInfo?
        
        let createdAt: Date
        let approvedAt: Date
        
        enum CodingKeys: String, CodingKey {
            case aid, tid, cid, partner_order_id, partner_user_id, payment_method_type, item_name, quantity, amount, card_info, created_at, approved_at
        }
          
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.aid = try container.decode(String.self, forKey: .aid).removingPercentEncoding ?? ""
            self.tid = try container.decode(String.self, forKey: .tid).removingPercentEncoding ?? ""
            self.cid = try container.decode(String.self, forKey: .cid).removingPercentEncoding ?? ""
            
            self.partnerOrderId = try container.decode(String.self, forKey: .partner_order_id).removingPercentEncoding ?? ""
            
            self.partnerUserId = try container.decode(String.self, forKey: .partner_user_id).removingPercentEncoding ?? ""
            
            self.paymentMethodType = try container.decode(String.self, forKey: .payment_method_type).removingPercentEncoding ?? ""
            
            self.itemName = try container.decode(String.self, forKey: .item_name).removingPercentEncoding ?? ""
            
            self.quantity = try container.decode(Int.self, forKey: .quantity)
            
            self.amount = try container.decode(Amount.self, forKey: .amount)
            
            self.cardInfo = try container.decode(CardInfo.self, forKey: .card_info)
            
            let RFC3339DateFormatter = DateFormatter()
            RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
            RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

            let createdAtString = try container.decode(String.self, forKey: .created_at)
              
            self.createdAt = RFC3339DateFormatter.date(from: createdAtString) ?? Date()
            
            let approveddAtString = try container.decode(String.self, forKey: .approved_at)
              
            self.approvedAt = RFC3339DateFormatter.date(from: approveddAtString) ?? Date()
        }
    }
    
    struct Amount : Decodable {
        let total: Int
        let taxFree: Int
        let vat: Int
        let point: Int
        let discount: Int
        
        enum CodingKeys: String, CodingKey {
            case total, tax_free, vat, point, discount
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.total = try container.decode(Int.self, forKey: .total)
            
            self.taxFree = try container.decode(Int.self, forKey: .tax_free)
            
            self.vat = try container.decode(Int.self, forKey: .vat)
            
            self.point = try container.decode(Int.self, forKey: .point)
            
            self.discount = try container.decode(Int.self, forKey: .discount)
        }
    }
    
    struct CanceledAmount : Decodable {
        let total: Int
        let taxFree: Int
        let vat: Int
        let point: Int
        let discount: Int
        
        enum CodingKeys: String, CodingKey {
            case total, tax_free, vat, point, discount
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.total = try container.decode(Int.self, forKey: .total)
            
            self.taxFree = try container.decode(Int.self, forKey: .tax_free)
            
            self.vat = try container.decode(Int.self, forKey: .vat)
            
            self.point = try container.decode(Int.self, forKey: .point)
            
            self.discount = try container.decode(Int.self, forKey: .discount)
        }
    }
    
    struct CanceledAvailableAmount : Decodable {
        let total: Int
        let taxFree: Int
        let vat: Int
        let point: Int
        let discount: Int
        
        enum CodingKeys: String, CodingKey {
            case total, tax_free, vat, point, discount
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.total = try container.decode(Int.self, forKey: .total)
            
            self.taxFree = try container.decode(Int.self, forKey: .tax_free)
            
            self.vat = try container.decode(Int.self, forKey: .vat)
            
            self.point = try container.decode(Int.self, forKey: .point)
            
            self.discount = try container.decode(Int.self, forKey: .discount)
        }
    }
    
    let api = API()
    let baseURL = "https://kapi.kakao.com/v1/payment"
    
    func query(completion: @escaping (Result<KakaoPayQuery, APIError>) -> Void) {
        guard let queryURL = URL(string: "\(baseURL)/order") else {
            return completion(.failure(.invalidURL))
        }
        
        let queryJSON = try? JSONEncoder().encode(
            QueryRequest(cid: "TC0ONETIME", tid: "T12345567890123456789")
        )

    }
    
    func ready(completion: @escaping (Result<KakaoPayReady, APIError>) -> Void) {
        guard let readyURL = URL(string: "\(baseURL)/ready") else {
            return completion(.failure(.invalidURL))
        }
        
        let queryJSON = try? JSONEncoder().encode(
            ReadyRequest(
                cid: "TC0ONETIME",
                partnerOrderId: "partner_order_id",
                partnerUserId: "partner_user_id",
                itemName: "초코파이",
                quantity: 1,
                totalAmount: 2200,
                vatAmount: 200,
                taxFreeAmount: 0,
                approvalUrl: "http://localhost:3000/success",
                failUrl: "http://localhost:3000/fail",
                cancelUrl: "http://localhost:3000/cancel"
            )
        )
        
        let queryDictionary = try? JSONSerialization.jsonObject(with: queryJSON ?? Data(), options: []) as? Dictionary<String, Any> ?? [:]
        
        let queryString = queryDictionary?.map {
            return "\($0.key)=\($0.value)"
        }.joined(separator: "&")
        
        let KAKAO_APP_KEY: String = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] as? String ?? "KAKAO_APP_KEY is nil"

        var request = URLRequest(url: readyURL)
        request.httpMethod = "POST"
        request.addValue("KakaoAK \(KAKAO_APP_KEY)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = (queryString ?? "").data(using: .utf8)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard error == nil else {
//
//            }

            let response = response as? HTTPURLResponse

            if (500 ..< 600) ~= response?.statusCode ?? 500 {
                return completion(.failure(.invalidResponse))
            }

            guard let data = data else {
                return completion(.failure(.invalidResponseData))
            }

            guard let result = try? JSONDecoder().decode(ReadyResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            let kakao = KakaoPayReady(tid: result.tid, appUrl: result.redirectAppUrl, mobileUrl: result.redirectMobileUrl, appScheme: result.iosAppScheme, createdAt: result.createdAt)
            completion(.success(kakao))
        }
        .resume()
    }
    
    func approve(completion: @escaping (Result<KakaoPayApprove, APIError>) -> Void) {
        guard let approveURL = URL(string: "\(baseURL)/approve") else {
            return completion(.failure(.invalidURL))
        }
        
        let queryJSON = try? JSONEncoder().encode(
            ApproveRequest(
                cid: "",
                tid: "",
                partnerOrderId: "",
                partnerUserId: "",
                pgToken: ""
            )
        )
        
        let queryDictionary = try? JSONSerialization.jsonObject(with: queryJSON ?? Data(), options: []) as? Dictionary<String, Any> ?? [:]
        
        let queryString = queryDictionary?.map {
            return "\($0.key)=\($0.value)"
        }.joined(separator: "&")
        
        let KAKAO_APP_KEY: String = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] as? String ?? "KAKAO_APP_KEY is nil"

        var request = URLRequest(url: approveURL)
        request.httpMethod = "POST"
        request.addValue("KakaoAK \(KAKAO_APP_KEY)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = (queryString ?? "").data(using: .utf8)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard error == nil else {
//
//            }

            let response = response as? HTTPURLResponse

            if (500 ..< 600) ~= response?.statusCode ?? 500 {
                return completion(.failure(.invalidResponse))
            }

            guard let data = data else {
                return completion(.failure(.invalidResponseData))
            }

            guard let result = try? JSONDecoder().decode(ApproveResponse.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }

            let kakao = KakaoPayApprove()
            completion(.success(kakao))
        }
        .resume()
    }
}
