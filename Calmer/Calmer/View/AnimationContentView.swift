//
//  AnimationContentView.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 30.05.2024.
//

import SwiftUI

struct AnimationContentView: View {
    @State private var isAnimation: Bool = false
    @State private var timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @State private var showFirstText = true
    
    var body: some View {
        VStack {
            Text("Breathing")
                .font(.title)
                .padding()
            
            Spacer()
            
            if self.isAnimation {
                Text(showFirstText ? "inhale" : "exhale")
                                .font(.title)
                                .foregroundColor(.gray)
                                .transition(.opacity)
                                .offset(y: -60)
                                .scaleEffect(self.showFirstText ? 1.5 : 1)
                                .animation(.easeInOut(duration: 3))
                                .onReceive(timer) { _ in
                                    withAnimation {
                                        self.showFirstText.toggle()
                                    }}
            }
            
            ZStack{
                ForEach(1...8,id: \.self){
                    index in Circle()
                        .fill(Color.indigo.gradient.opacity(0.5))
                        .frame(width: 150,height: 150)
                        .offset(x: self.isAnimation ? 75 : 0)
                        .rotationEffect(.init(degrees: Double(index) * 45))
                }
            }
            .animation(self.isAnimation ? .easeInOut(duration: 4).repeatForever(autoreverses: true) : .default)
            
            
            Spacer()
            
            Button{
                withAnimation {
                    self.isAnimation.toggle()
                }
            } label: {
                Text(self.isAnimation ? "Stop" : "Start")
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(.indigo)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .clipShape(Capsule())
            }.offset(y: -40)
        }
        

   
        
        
    }
}

#Preview {
    AnimationContentView()
}
