//
//  MyToDoApp.swift
//  MyToDo
//
//  Created by Lesley Lopez on 9/26/24.
//

import SwiftUI
import SwiftData

@main
struct MyToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:Task.self)
        }
    }
}
