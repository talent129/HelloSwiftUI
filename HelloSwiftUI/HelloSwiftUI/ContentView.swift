//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Curtis on 2024/6/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Image(systemName: "creditcard.viewfinder")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            
            Text("Knock, knock!")
                .padding()
            
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print("点击了按钮")
            }
            .foregroundStyle(.purple)
            .font(.system(size: 20, weight: .medium))
            .padding()
            
            Text("Knock, knock!")
                .padding()
                .background(Color.yellow, in: .buttonBorder)
                
            Text("Who's there?")
                .padding()
                .background(Color.teal, in: .buttonBorder)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
