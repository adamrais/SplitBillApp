//
//  Group.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import Foundation

struct group: Identifiable, Codable {
    var id = UUID()
    var name: String
    var numberOfPerson: Int
    var dateCreated: Date
    var moneyBack: Int
    var moneyDebt: Int
}
