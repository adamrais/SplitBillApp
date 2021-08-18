//
//  GroupViewModel.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import Foundation

class groupsViewModel: ObservableObject {
    @Published var groups = [group]()
    @Published var totalMoneyOwned: Int
    
    init() {
        //fetchStaticGroup()
        totalMoneyOwned = 0
        groups.append(group(name: "Init group", numberOfPerson: 4, dateCreated: Date().addingTimeInterval(-86400)))
        print(groups)
    }
    
    func fetchStaticGroup() {
        groups.append(group(name: "test group", numberOfPerson: 2, dateCreated: Date()))
        print(groups)
    }
    
}
