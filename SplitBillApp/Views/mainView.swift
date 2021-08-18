//
//  mainView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import SwiftUI

struct mainView: View {
    @StateObject var vm = groupsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                moneyOwnedSectionView(moneyOwned: vm.totalMoneyOwned)
                ScrollView {
                    ForEach(vm.groups) { group in
                        GroupContainers(name: group.name, numberOfPerson: group.numberOfPerson, dateCreated: group.dateCreated)
                    }                }
            }.navigationTitle("Groups")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                // add action
            }, label: {
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.black)
            }), trailing: Button(action: {
                //vm.fetchStaticGroup()
                vm.groups.append(group(name: "Group1", numberOfPerson: 2, dateCreated: Date()))
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(.black)
            }))
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
