//
//  CustomGroupContainer.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-25.
//

import SwiftUI

struct CustomGroupContainer: View {
    let groupInfo: group
    @State private var isActive = false
    @EnvironmentObject var vmEnv: groupsViewModel
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(.systemIndigo))
                    .frame(width: 370, height: 150)
                    .cornerRadius(15)
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("\(groupInfo.name)")
                        Text("We own me: \(groupInfo.moneyBack) \(vmEnv.currencies[vmEnv.currency])")
                            .font(.callout)
                            .foregroundColor(Color(.systemGray6))
                    }.padding()
                    
                    HStack {
                        Text("Debts")
                        Spacer()
                        Image(systemName: "chart.bar.fill")
                            .disabled(false)
                    }.padding()
                    .foregroundColor(isActive ? .white : Color(.systemGray6))
                }.foregroundColor(.white)
                .padding()
                .font(.title2)
            }
        }
    }
}

struct CustomGroupContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomGroupContainer(groupInfo: group(name: "group1", numberOfPerson: 2, dateCreated: Date(), moneyBack: 0, moneyDebt: 0))
            .environmentObject(groupsViewModel())
    }
}
