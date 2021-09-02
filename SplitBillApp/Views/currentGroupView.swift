//
//  currentGroupView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-20.
//

import SwiftUI

struct currentGroupView: View {
    @StateObject var vm = groupsViewModel()
    @EnvironmentObject var vmEnv: groupsViewModel
    @State private var showBillView = false
    let groupInfo: group
    var body: some View {
        ZStack {
            VStack {
                CustomGroupContainer(groupInfo: groupInfo)
            }.modifier(navigationModifier())
            .position(x: 200, y: 100)
            
            floatingButton(showBills: $showBillView)
                .sheet(isPresented: $showBillView) {
                    BillsView(groupInfo: groupInfo, showModal: $showBillView)
                }
        }
    }
}

// MARK: - Views
struct floatingButton: View {
    @Binding var showBills: Bool
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    // add action
                    showBills.toggle()
                }, label: {
                    Text("+")
                        .modifier(plusSignModifier())
                }).modifier(plusButtonModifier())
            }
        }
    }
}

// MARK: - modifiers
struct plusSignModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.largeTitle))
            .frame(width: 77, height: 70)
            .foregroundColor(Color.white)
            .padding(.bottom, 7)
    }
}

struct plusButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.blue)
            .cornerRadius(38.5)
            .padding()
            .shadow(color: Color.black.opacity(0.3),
                    radius: 3,
                    x: 3,
                    y: 3)
    }
}

// modifiers
struct navigationModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    @State private var showSheet = false
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                // add action
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            }),trailing: Button(action: {
                // add action
                showSheet = true
            }, label: {
                Image(systemName: "gearshape")
                    .foregroundColor(.black)
            }))
            .sheet(isPresented: $showSheet) {
                GroupSettingsView(showModal: $showSheet)
            }
        }
}

struct currentGroupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            currentGroupView(groupInfo: group(name: "group1", numberOfPerson: 2, dateCreated: Date(), moneyBack: 0, moneyDebt: 0))
                .environmentObject(groupsViewModel())
        }
    }
}
