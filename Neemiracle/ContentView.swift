//
//  ContentView.swift
//  Neemiracle
//
//  Created by Erkebulan Massainov on 01.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                To_Do_List()
                    .tabItem {
                        ZStack{
                            Rectangle()
                                .foregroundColor(.purple)
                                .frame(height: 100)
                            Image(systemName: "house")
                                
                        }.padding()
                        
                            
                    }
                    
                    
                To_Do_Done()
                    .tabItem {
                        Image(systemName: "trophy")
                            .padding()
                    }
                    
            }
//            .toolbarBackground(.black, for: .tabBar)
//            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(.secondRed)
    }
}

#Preview {
    ContentView()
}
