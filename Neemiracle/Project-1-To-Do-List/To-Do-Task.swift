//
//  To-Do-Task.swift
//  Neemiracle
//
//  Created by Erkebulan Massainov on 02.09.2024.
//

import SwiftUI

struct To_Do_Task: View {
    @State private var animation = false
    @State private var posY: CGFloat = 400
    @State private var posX: CGFloat = 200
    
    @State private var showEdit = false
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var task: Task
    var index : Int
    var body: some View {
        
        ZStack{
            Circle()
                .frame(width: 50)
                .blur(radius: 10)
                .foregroundColor(.secondRed)
                .offset(x: -posX,y: animation ? posY: -posY)
                .animation(
                    Animation
                        .linear(duration: 1)
                        .repeatForever()
                    , value: animation)
                .shadow(color: .lightRed, radius: 3)
            Circle()
                .frame(width: 50)
                .blur(radius: 10)
                .foregroundColor(.secondRed)
                .offset(x: posX,y: animation ? -posY: posY)
                .animation(
                    Animation
                        .linear(duration: 1)
                        .repeatForever()
                    , value: animation)
                .shadow(color: .lightRed, radius: 3)
            Circle()
                .frame(width: 50)
                .blur(radius: 10)
                .foregroundColor(.secondRed)
                .offset(x: animation ? -posX : posX,y: -posY)
                .animation(
                    Animation
                        .linear(duration: 1)
                        .repeatForever()
                    , value: animation)
                .shadow(color: .lightRed, radius: 3)
            Circle()
                .frame(width: 50)
                .blur(radius: 10)
                .foregroundColor(.secondRed)
                .offset(x: animation ? posX : -posX,y: posY)
                .animation(
                    Animation
                        .linear(duration: 1)
                        .repeatForever()
                    , value: animation)
                .shadow(color: .lightRed, radius: 3)
            VStack{
                Text("\(task.needToDo)")
                    .foregroundColor(.lightRed)
                    .font(Font.custom("Nosifer-Regular", size: 20))
                    .frame(width: 300, height: 150)
                    .padding(.vertical)
                Spacer()
                HStack(spacing: 30){
                    ZStack{
                        Circle()
                            .stroke()
                            .frame(width: 50)
                            .foregroundColor(.lightRed)
                        Image(systemName: "arrowshape.backward")
                            .foregroundColor(.lightRed)
                            .font(.system(size: 18))
                    }
                    .onTapGesture{
                        dismiss()
                    }
                    
                    ZStack{
                        Circle()
                            .stroke()
                            .frame(width: 50)
                            .foregroundColor(.lightRed)
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.lightRed)
                            .font(.system(size: 18))
                    }
                    .onTapGesture{
                        showEdit = true
                    }
                    ZStack{
                        Circle()
                            .stroke()
                            .frame(width: 50)
                            .foregroundColor(.lightRed)
                        
                        Text("X")
                            .foregroundColor(.lightRed)
                            .font(.system(size: 18))
                    }
                    .onTapGesture{
                        context.delete(task)
                        dismiss()
                    }
                    .shadow(color: .black,radius: 100)
                    
                    ZStack{
                        Circle()
                            .stroke()
                            .frame(width: 50)
                            .foregroundColor(.lightRed)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.lightRed)
                            .font(.system(size: 18))
                    }
                    .onTapGesture{
                        task.done = true
                        dismiss()
                    }
                    .shadow(color: .black,radius: 100)
                }    
            }
            .padding()
            .overlay(alignment: .top){
                
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [.firstRed, .secondRed], startPoint: .top, endPoint: .bottom)
        )
        .onAppear{
            animation.toggle()
        }
        .sheet(isPresented: $showEdit) {
            To_Do_Edit(task: task)
        }
    }
}

