//
//  Group.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import Foundation

struct group: Identifiable {
    var id = UUID()
    var name: String
    var numberOfPerson: Int
    var dateCreated: Date
}
