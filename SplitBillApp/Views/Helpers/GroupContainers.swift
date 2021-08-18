//
//  GroupContainers.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import SwiftUI

struct GroupContainers: View {
    var name: String
    var numberOfPerson: Int
    var dateCreated: Date
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 370, height: 150)
                    .cornerRadius(15)
                VStack {
                    HStack {
                        Text("\(name)")
                        Spacer()
                        Label(
                            title: { Text("\(numberOfPerson)") },
                            icon: { Image(systemName: "person") }
                        )
                    }.padding()
                    .font(.title2)
                    VStack {
                        Text("Date created: ")
                        Text(dateCreated, style: .date)
                    }
                }.foregroundColor(.white)
                .padding()
            }
        }
    }
}

struct GroupContainers_Previews: PreviewProvider {
    static var previews: some View {
        GroupContainers(name: "group1", numberOfPerson: 2, dateCreated: Date())
    }
}
