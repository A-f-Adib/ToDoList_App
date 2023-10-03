//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by A.f. Adib on 10/1/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
   @StateObject var listViewModel : ListViewModels = ListViewModels()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
//            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
