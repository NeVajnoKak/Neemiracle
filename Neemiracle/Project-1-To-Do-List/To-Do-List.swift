//
//  To-Do-List.swift
//  Neemiracle
//
//  Created by Erkebulan Massainov on 01.09.2024.
//

import SwiftUI
import SwiftData

struct To_Do_List: View {
    @Query(filter: #Predicate<Task> { task in
        task.done == false
    }, sort: \Task.needToDo) private var tasks: [Task]
    @Environment(\.modelContext) private var context
    
    @State private var initialX: CGFloat?
    @State private var currentX: CGFloat = 0
    
    @State private var backgroundAnimation = false
    
    @State private var count = 1
    @State private var currentPage = 0
    
    @State private var doneTasks = 0
    @State private var nameOfMonth = ""
    
    @State private var createTask = false
    @State private var openCard = false
    
    @ObservedObject var router = Router()
    
    @State private var isShowingInfo = false
    let now = Date()
    let dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("To Do List")
                    .foregroundColor(.secondRed)
                    .font(Font.custom("Nosifer-Regular", size: 28))
                ScrollView(.horizontal, showsIndicators: false){
                    
                    ZStack{
                        HStack(spacing: 40){
                            GeometryReader{ geo in
  
                                let currentText = tasks.isEmpty ? "Empty" : currentPage < tasks.count ? tasks[currentPage].needToDo : "Empty"

                                    
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 310,height: 510)
                                            .foregroundColor(.clear)
                                            .background(
                                                LinearGradient(colors: [.firstRed, .secondRed], startPoint: .top, endPoint: .bottom)
                                            )
                                            .clipShape(RoundedRectangle(cornerRadius: 40))
                                        VStack{
                                            
                                            Text("\(currentText)")
                                                .foregroundColor(.lightRed)
                                                .frame(width: 280, height: 400)
                                                .font(Font.custom("Nosifer-Regular", size: 30))
                                            
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    .onAppear{
                                        if initialX == nil {
                                            initialX = geo.frame(in: .global).origin.x
                                        }
                                        dateFormatter.dateFormat = "EEEE"
                                        nameOfMonth = dateFormatter.string(from: now)
                                    }
                                    
                                    .onChange(of: geo.frame(in: .global).origin.x){
                                        if currentText != "Empty" {
                                            if !openCard {
                                                currentX = geo.frame(in: .global).origin.x
                                                
                                                if let initialX = initialX {
                                                    if currentX > initialX {
                                                        count -= 1
                                                    }
                                                    else if currentX < initialX {
                                                        count += 1
                                                    }
                                                    else {
                                                        
                                                        if count != 0 {
                                                            if count < 0 && currentPage > 0 {
                                                                currentPage -= 1
                                                            }
                                                            else if count > 0 && currentPage < tasks.count - 1{
                                                                currentPage += 1
                                                            }
                                                            count = 0
                                                        }
                                                        
                                                        
                                                    }
                                                }
                                                
                                            }
                                        }
                                        
                                    }
                                    .onTapGesture {
                                        if currentText != "Empty" {
                                            isShowingInfo.toggle()
                                        }
                                    }
                                    .sheet(isPresented: $isShowingInfo) {
                                        if currentText != "Empty" {
                                            To_Do_Task(task: tasks[currentPage], index: currentPage)
                                        }
                                        
                                    }
                                    .overlay(alignment:.top){
                                        Text("Achievements to reach")
                                            .foregroundColor(.secondRed)
                                            .padding()
                                            .font(Font.custom("Nosifer-Regular", size: 13))
                                    }
                                    .overlay(alignment: .bottomTrailing){
                                        if currentText != "Empty" {
                                            Text("\(currentPage + 1)/\(tasks.count)")
                                                .foregroundColor(.black)
                                                .padding()
                                                .font(Font.custom("Nosifer-Regular", size: 13))
                                        }
                                        
                                    }
                                    //                                }
                                
                            }
                        }
                        .frame(height: 520)
                        .padding(.leading, 40)
                    }
                    
                    
                    
                    
                }
                Button () {
                    createTask.toggle()
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                        Text("Add task")
                            .foregroundColor(.lightRed)
                            .font(Font.custom("Nosifer-Regular", size: 25))
                    }
                }
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                    Rectangle()
                        .foregroundColor(.lightRed)
                        .frame(height: 400)
                        .offset(y: backgroundAnimation ? -400: -300)
                        .animation(
                            Animation
                                .linear(duration: 1)
                                .repeatForever()
                                .speed(0.1)
                            , value: backgroundAnimation)
                        .shadow(color: .lightRed, radius: 200)
                        .blur(radius: 10)
                }
                
                    .edgesIgnoringSafeArea(.all)
            )
            .onAppear{
                backgroundAnimation.toggle()
            }
            .onChange(of: tasks) { _ in
                        if currentPage >= tasks.count {
                            currentPage = max(tasks.count - 1, 0) // Чтобы не выйти за пределы массива
                        }
                    }
            .sheet(isPresented: $createTask) {
                To_Do_Create()
            }
            
        }
        
    }
}

#Preview {
    To_Do_List()
}
