//
//  NewGroupView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-18.
//

import SwiftUI

struct NewGroupView: View {
    @ObservedObject var vm = groupsViewModel()
    @Binding var showModal: Bool
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
                Text("New Group")
                Spacer()
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
            }
            
            //Bottom
            Button(action: {
                // save data
                vm.addGroup(name: groupName, numberOfPerson: membersCount+1, dateCreated: Date())
                showModal.toggle()
            }, label: {
                Text("Button")
            })

        }
    }
}

private func addGroup() {
    //vm.
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}
struct headerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(.title3, design: .rounded)
            .bold())
            .background(Color.blue)
        }
}

struct NewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        NewGroupView(showModal: .constant(true))
    }
}
