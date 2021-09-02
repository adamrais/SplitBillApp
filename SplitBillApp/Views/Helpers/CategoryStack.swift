//
//  CategoryStack.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-30.
//

import SwiftUI

struct CategoryStack: View {
    @EnvironmentObject var vmEnv: groupsViewModel
    let groupInfo: group
    let twoColumns = [GridItem(GridItem.Size.fixed(50)),
                      GridItem(.fixed(100))]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: twoColumns) {
                    ForEach(0 ..< vmEnv.categories.count) { item in
                        Button(action: {
                            // add action when category is clicked
                            vmEnv.isSelected.toggle()
                            vmEnv.selectedCategory = vmEnv.categories[item]
                            print("The \(vmEnv.selectedCategory) category was selected")
                        }, label: {
                            VStack {
                                Image(systemName: "\(vmEnv.categories[item])")
                                Text("\(vmEnv.categories[item])")
                            }
                        })
                        .buttonStyle(SimpleButtonStyle())
                    }
                    Button(action: {
                        // MARK: - TODO add alert for when there is more than 10 items
                        // add action to add a new category
                        if vmEnv.categories.count <= 10 {
                            vmEnv.categories.append("pills")
                        }
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                    })
                }.font(.body)
            }
        }
    }
}

struct CategoryStack_Previews: PreviewProvider {
    static var previews: some View {
        CategoryStack(groupInfo: group(name: "group1", numberOfPerson: 2, dateCreated: Date(), moneyBack: 0, moneyDebt: 0))
        .environmentObject(groupsViewModel())
    }
}
