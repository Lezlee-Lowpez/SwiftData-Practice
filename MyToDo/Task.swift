//
//  Task.swift
//  MyToDo
//
//  Created by Lesley Lopez on 10/1/24.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    
    @Attribute(.unique) var id: String
    var task: String = ""
    
    init() {
        id = UUID().uuidString
    }
}
