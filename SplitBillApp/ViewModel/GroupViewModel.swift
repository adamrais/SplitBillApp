//
//  GroupViewModel.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import Foundation

class groupsViewModel: ObservableObject {
    static let groupsKey = "Movies"
    static let defaultGroup = [
        group(name: "Init group", numberOfPerson: 4, dateCreated: Date().addingTimeInterval(-86400), moneyBack: 20, moneyDebt: 0)
    ]
    @Published var groups = loadGroups()
    @Published var totalMoneyOwned: Int
    @Published var currency = 0
    @Published var currentGroupInfo: group?
    @Published var isSelected: Bool
    var currencies = ["CAD","USD", "YEN", "EURO"]
    @Published var selectedCategory: String
    @Published var categories = ["film","house","car","person","bag","heart","creditcard"]
    
    init() {
        totalMoneyOwned = 0
        isSelected = false
        selectedCategory = ""
    }
    
    static func loadGroups() -> [group] {
        let savedGroups = UserDefaults.standard.object(forKey: groupsViewModel.groupsKey)
        if let savedGroups = savedGroups as? Data {
            let decoder = JSONDecoder()
            return (try? decoder.decode([group].self, from: savedGroups)) ?? groupsViewModel.defaultGroup
        }
        return groupsViewModel.defaultGroup
    }
    
    func addGroup(name: String, numberOfPerson: Int, dateCreated: Date, moneyBack: Int, moneyDebt: Int) {
        let newGroup = group(name: name, numberOfPerson: numberOfPerson, dateCreated: dateCreated, moneyBack: moneyBack, moneyDebt: moneyDebt)
        groups.append(newGroup)
    }
    
    func updateGroup(name: String, numberOfPerson: Int, dateCreated: Date, moneyBack: Int, moneyDebt: Int) {
        let newGroup = group(name: name, numberOfPerson: numberOfPerson, dateCreated: dateCreated, moneyBack: moneyBack, moneyDebt: moneyDebt)
        currentGroupInfo = newGroup
    }
    
    func deleteGroup(at offsets: IndexSet) {
        groups.remove(atOffsets: offsets)
    }
    
}
