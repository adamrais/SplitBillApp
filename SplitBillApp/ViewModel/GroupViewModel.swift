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
        group(name: "Init group", numberOfPerson: 4, dateCreated: Date().addingTimeInterval(-86400))
    ]
    @Published var groups = loadGroups()
    @Published var totalMoneyOwned: Int
    
    init() {
        totalMoneyOwned = 0
    }
    
    static func loadGroups() -> [group] {
        let savedGroups = UserDefaults.standard.object(forKey: groupsViewModel.groupsKey)
        if let savedGroups = savedGroups as? Data {
            let decoder = JSONDecoder()
            return (try? decoder.decode([group].self, from: savedGroups)) ?? groupsViewModel.defaultGroup
        }
        return groupsViewModel.defaultGroup
    }
    
    func addGroup(name: String, numberOfPerson: Int, dateCreated: Date) {
        let newGroup = group(name: name, numberOfPerson: numberOfPerson, dateCreated: dateCreated)
        groups.append(newGroup)
    }
    
}
