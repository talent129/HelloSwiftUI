//
//  DiceView.swift
//  DiceRoller
//
//  Created by Curtis on 2024/6/27.
//

import SwiftUI

struct DiceView: View {
    
    /// 使用@State关键字 告诉SwiftUI监视numberOfPips属性 并在发生变化时更新UI
    /// View State由视图拥有
    /// 应该始终将状态属性标记为私有，以便其他视图不能干扰它们的值
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}
