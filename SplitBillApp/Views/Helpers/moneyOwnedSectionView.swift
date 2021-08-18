//
//  moneyOwnedSectionView.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-17.
//

import SwiftUI

struct moneyOwnedSectionView: View {
    var moneyOwned: Int
    var body: some View {
        VStack {
            Text("Money that we own me in total")
                .foregroundColor(.gray)
            HStack {
                Text("\(moneyOwned)")
                    .font(.system(.title, design: .rounded)
                    .bold())
                CurrencyStepperView()
            }
        }.padding()

        Divider()
        ZStack(alignment: .top) {
        Text("Recent").bold().foregroundColor(.gray)
        }
    }
}

struct moneyOwnedSectionView_Previews: PreviewProvider {
    static var previews: some View {
        moneyOwnedSectionView(moneyOwned: 2)
    }
}
