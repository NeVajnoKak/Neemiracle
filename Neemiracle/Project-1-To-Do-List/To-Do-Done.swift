//
//  To-Do-Done.swift
//  Neemiracle
//
//  Created by Erkebulan Massainov on 07.09.2024.
//

import SwiftUI
import SwiftData

struct To_Do_Done: View {
    @ObservedObject var router = Router()
    @Environment(\.dismiss) var dismiss
    @State private var animation = false
    
    @Query private var tasks: [Task]
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.lightRed)
                .blur(radius: 30)
                .frame(width: 400, height: 30)
                .offset(y: animation ? -500: 500)
                .animation(
                    Animation
                        .linear(duration: 3)
                        .repeatForever()
                    ,
                    value: animation
                )
            ScrollView(showsIndicators: false){
                VStack(spacing: 40){
                    ForEach(tasks) { task in
                        if task.done {
                            Text("\(task.needToDo)")
                                .foregroundColor(.lightRed)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .shadow(color: .firstRed, radius: 20)
                                )
                                .font(Font.custom("Nosifer-Regular", size: 18))
                        }

                    }
                    
                    
                }
                .padding(.top, 90)
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .onAppear{
            animation.toggle()
        }
    }
}

#Preview {
    To_Do_Done()
}
