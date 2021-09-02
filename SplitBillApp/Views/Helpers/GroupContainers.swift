//
//  GroupContainers.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import SwiftUI

struct GroupContainers: View {
    @EnvironmentObject var vmEnv: groupsViewModel
    let groupInfo: group
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(.systemIndigo))
                    .frame(width: 370, height: 150)
                    .cornerRadius(15)
                VStack {
                    HStack {
                        Text("\(groupInfo.name)")
                        Text("\(vmEnv.currentGroupInfo?.name ?? "")")
                        Spacer()
                        Label(
                            title: { Text("\(groupInfo.numberOfPerson)") },
                            icon: { Image(systemName: "person") }
                        )
                    }.padding()
                    .font(.title2)
                    VStack(alignment: .leading) {
                        Text("Last update: ")
                        Text(groupInfo.dateCreated, style: .date)
                    }.padding(.trailing, 200)
                }.foregroundColor(.white)
                .padding()
            }
        }
    }
}

struct GroupContainers_Previews: PreviewProvider {
    static var previews: some View {
        GroupContainers(groupInfo: group(name: "group1", numberOfPerson: 2, dateCreated: Date(), moneyBack: 0, moneyDebt: 0))
            .environmentObject(groupsViewModel())
    }
}
