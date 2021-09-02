//
//  BillsView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-29.
//

import SwiftUI

struct BillsView: View {
    let groupInfo: group
    @EnvironmentObject var vmEnv: groupsViewModel
    @Binding var showModal: Bool
    var body: some View {
        VStack {
            //Header
            HStack(alignment: .top) {
                Button("\(Image(systemName: "xmark"))") {
                    showModal.toggle()
                }
                Spacer()
                Text(groupInfo.name)
                Spacer()
            }.padding()
            .modifier(headerModifier())
            Spacer()
            
            //Body
            Form {
                Section(header: Text("Categories")) {
                    CategoryStack(groupInfo: groupInfo)
                }
            }
        }
    }
}

struct BillsView_Previews: PreviewProvider {
    static var previews: some View {
        BillsView(groupInfo: group(name: "group1", numberOfPerson: 2, dateCreated: Date(), moneyBack: 0, moneyDebt: 0), showModal: .constant(true))
            .environmentObject(groupsViewModel())
        //BillsView(showModal: .constant(true))
    }
}
