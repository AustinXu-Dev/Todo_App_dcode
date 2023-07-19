//
//  Todo_App_dcodeApp.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/16.
//

import SwiftUI

@main
struct Todo_App_dcodeApp: App {
    @StateObject var listViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView{
                MainView()
            }.environmentObject(listViewModel)
        }
    }
}
