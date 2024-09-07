//
//  To-Do-Edit.swift
//  Neemiracle
//
//  Created by Erkebulan Massainov on 07.09.2024.
//

import SwiftUI

struct To_Do_Edit: View {
    let task: Task
    @Binding var showEdit: Bool
    @Binding var isShowingInfo: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var newName = ""
    var body: some View {
        VStack(){
            VStack{
                Text("Old name")
                    .foregroundColor(.lightRed)
                Text("\(task.needToDo)")
                    .foregroundColor(.lightRed)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        Rectangle()
                            .foregroundColor(.firstRed)
                        )
            }
            .padding(.bottom, 200)
           
            VStack{
                Text("new name")
                    .foregroundColor(.lightRed)
                    .frame(maxWidth: .infinity)
                TextField("Type new name", text: $newName)
                    .foregroundColor(.firstRed)
                    .padding()
                    .background(
                        Rectangle()
                            .foregroundColor(.lightRed))
            }
            Spacer()
                    
            
        }
        
        .padding(.top, 100)
        .font(Font.custom("Nosifer-Regular", size: 15))
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        
        .overlay(alignment: .bottomTrailing) {
            Button {
                if newName != "" {
                    task.needToDo = newName
                }
                isShowingInfo = false
                showEdit = false 
                dismiss()
                
            } label: {
                Image(systemName: "checkmark")
                    .foregroundColor(.lightRed)
                    .font(.system(size: 18))
                    .padding()
                    .background(
                    Circle()
                        .foregroundColor(.secondRed)
                    )
            }
            .padding(.horizontal)
            
        }
       
    }
}

