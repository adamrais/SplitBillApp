//
//  mainView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import SwiftUI

struct mainView: View {
    @StateObject var vm = groupsViewModel()
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                moneyOwnedSectionView(moneyOwned: vm.totalMoneyOwned)
                ScrollView {
                    ForEach(vm.groups) { group in
                        GroupContainers(groupInfo: group)
                    }
                }
            }.navigationTitle("Groups")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                // add action
            }, label: {
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.black)
            }), trailing: Button(action: {
                showSheet = true
                //vm.fetchStaticGroup()
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(.black)
            }))
            .sheet(isPresented: $showSheet) {
                NewGroupView(vm: vm, showModal: $showSheet)
            }
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
