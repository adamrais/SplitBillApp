//
//  SplitBillAppApp.swift
//  SplitBillApp
//
//  Created by Adam Rais on 2021-08-16.
//

import SwiftUI

@main
struct SplitBillAppApp: App {
    @StateObject var vmEnv = groupsViewModel()
    var body: some Scene {
        WindowGroup {
            mainView()
                .environmentObject(vmEnv)
        }
    }
}
