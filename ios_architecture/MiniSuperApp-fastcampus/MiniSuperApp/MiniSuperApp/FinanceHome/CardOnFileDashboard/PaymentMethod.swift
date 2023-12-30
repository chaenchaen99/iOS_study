//
//  PaymentMethod.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/09/12.
//

import Foundation

//백엔드에서 받아오므로 Decodable
struct PaymentMethod: Decodable {
    let id: String
    let name: String
    let digits: String
    let color: String
    let isPrimary: Bool
}
