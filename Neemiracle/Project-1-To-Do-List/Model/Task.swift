//
//  Task.swift
//  Neemiracle
//
//  Created by Erkebulan Massainov on 03.09.2024.
//

import SwiftData
import SwiftUI
import Foundation

@Model
class Task {
    var needToDo: String
    var done: Bool
    
    init(needToDo: String, done: Bool = false) {
        self.needToDo = needToDo
        self.done = done
    }
}
