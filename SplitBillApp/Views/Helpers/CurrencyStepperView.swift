//
//  CurrencyStepperView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-17.
//

import SwiftUI

struct CurrencyStepperView: View {
    @State private var selectedCurrency = 0
    @EnvironmentObject var vmEnv: groupsViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(5)
                .frame(width: 120, height: 40)
            Picker(selection: $vmEnv.currency, label: Label(
                    "\(vmEnv.currencies[vmEnv.currency])", systemImage: "chevron.down")) {
                ForEach(0..<vmEnv.currencies.count) {
                    Text(self.vmEnv.currencies[$0])
                }
            }.modifier(pickerModifier())
            
        }.pickerStyle(MenuPickerStyle())
        .labelStyle(VerticalLabelStyle())
    }
}

// modifiers
struct pickerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded)
            .bold())
        }
}

struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .firstTextBaseline) {
            configuration.title
            configuration.icon
        }
    }
}

struct CurrencyStepperView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyStepperView()
            .environmentObject(groupsViewModel())
    }
}
