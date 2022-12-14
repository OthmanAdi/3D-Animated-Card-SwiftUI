//
//  ContentView.swift
//  3DCard
//
//  Created by Yunlong.Adi on 21.10.22.
//
// Display a Text that says "Surprise" Behind the Rectangle in the Center of the Frame with color and bigger fontSize

// * Show text in VStack
// * Center the Text
// * Change Text Color and Size

import SwiftUI

struct ContentView: View {
    
    @State var dragAmount = CGSize.zero
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [.yellow, .green, .red, .purple]
                        ),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
                .frame(width: 200, height: 150)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 20
                    ))
                .rotation3DEffect(.degrees(-Double(dragAmount.width) / 20), axis:(x:0, y:1, z:0))
                .rotation3DEffect(.degrees(Double(dragAmount.height / 20)), axis:(x:1, y:0, z:0))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged{
                            dragAmount = $0.translation
                        }
                        .onEnded{ _ in
                            withAnimation(.spring()){
                                dragAmount = .zero
                            }
                        }
                )
            
        } .frame(width: 400, height: 150)
            .background(
                Gradient(
                    colors: [.white, .pink]
                ) //Ende von Gradient()
            ) //Ende von .background
            .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
