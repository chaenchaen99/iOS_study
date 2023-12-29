//
//  NumberFormatter.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/09/04.
//

import Foundation

struct Formatter {
    static let balanceFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
