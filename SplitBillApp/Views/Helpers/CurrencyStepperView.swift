//
//  CurrencyStepperView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-17.
//

import SwiftUI

struct CurrencyStepperView: View {
    var currencies = ["CAD","USD", "YEN", "EURO"]
    @State private var selectedCurrency = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(5)
                .frame(width: 120, height: 40)
            Picker(selection: $selectedCurrency, label: Label(
                    "\(currencies[selectedCurrency])", systemImage: "chevron.down")) {
                ForEach(0..<currencies.count) {
                    Text(self.currencies[$0])
                }
            }.modifier(pickerModifier())
            
        }.pickerStyle(MenuPickerStyle())
        .labelStyle(VerticalLabelStyle())
    }
}

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
    }
}
