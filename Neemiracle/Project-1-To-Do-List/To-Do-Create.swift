//
//  To-Do-Create.swift
//  Neemiracle
//
//  Created by Erkebulan Massainov on 06.09.2024.
//

import SwiftUI

struct To_Do_Create: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var task = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("What u wanna do" , text: $task)
                
                Button("Create") {
                    let newTask = Task(needToDo: task)
                    context.insert(newTask)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(task.isEmpty)
                .navigationTitle("Add Task")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

#Preview {
    To_Do_Create()
}
