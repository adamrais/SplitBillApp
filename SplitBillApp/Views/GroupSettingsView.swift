//
//  GroupSettingsView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-20.
//

import SwiftUI

struct GroupSettingsView: View {
    @Binding var showModal: Bool
    @ObservedObject var vm = groupsViewModel()
    @EnvironmentObject var vmEnv: groupsViewModel
    
    @State private var groupName = ""
    @State private var addMember = false
    @State private var membersCount = 0
    @State private var member = ""
    var body: some View {
        VStack {
            //Header
            HStack(alignment: .top) {
                Button("\(Image(systemName: "xmark"))") {
                    showModal.toggle()
                }
                Spacer()
                Text("Group Settings")
                Spacer()
                Button("\(Image(systemName: "checkmark"))") {
                    vm.updateGroup(name: groupName, numberOfPerson: membersCount+1, dateCreated: Date(), moneyBack: 0, moneyDebt: 0)
                    showModal.toggle()
                    print("test")
                }
            }.padding()
            .modifier(headerModifier())
            Spacer()
            
            //Body
            Form {
                Section(header: Text("Name of the group")) {
                    TextField("Name of the group", text: $groupName).modifier(ClearButton(text: $groupName))
                }
                
                Section(header: Text("Members")) {
                    HStack {
                        Text("Default member")
                        Spacer()
                        Text("Leader")
                            .font(.caption)
                    }
                    if addMember {
                        ForEach((1...membersCount), id: \.self) { _ in
                            TextField("", text: $member)
                        }
                    }
                    Button(action: {
                        addMember = true
                        if membersCount <= 5 {
                            membersCount += 1
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add a new member")
                        }.foregroundColor(.black)
                    })
                }
                
                Section(header: Text("Currency")) {
                    CurrencyStepperView()
                }
                
                categorySection
            }
            
            //Bottom
            Button(action: {
                // delete group
                //vm.deleteGroup(at: )
                showModal.toggle()
            }, label: {
                Text("Delete Group")
            })
        }
    }
    
    // MARK: - subViews
    private var categorySection: some View {
        Section(header: Text("Categories")) {
            //TODO add categories section
            HStack {
                ForEach(0 ..< vmEnv.categories.count) { item in
                    VStack {
                        Image(systemName: vmEnv.categories[item])
                        Text(vmEnv.categories[item]).font(.footnote)
                    }
                    
                }
                Button(action: {
                    // add action
                    print("choosen")
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}

struct GroupSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupSettingsView(showModal: .constant(true))
            .environmentObject(groupsViewModel())
    }
}
