//
//  SomeButton.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-31.
//

import SwiftUI

struct SimpleButtonStyle: ButtonStyle {
    @EnvironmentObject var vmEnv: groupsViewModel
    func pressColor(isPressed: Bool) -> Color {
      if isPressed {
        return Color.purple
      }
      else {
        return Color.white
      }
  }
 
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding([.trailing, .leading], 10)
      .padding([.top, .bottom], 5)
      .border(pressColor(isPressed: configuration.isPressed), width: 3)

  }
}

struct SomeButton : View {
    @State private var isPressed = false
  var body: some View {
    HStack{
      Button(action: {
        isPressed.toggle()
        print("Pressed")
      }) {
        Text("Press")
        Image("food")
      }
    }
    .buttonStyle(SimpleButtonStyle())
    .font(.headline)
    .padding(.trailing, 10)
  }
}

struct SomeButton_Previews: PreviewProvider {
    static var previews: some View {
        SomeButton()
    }
}
