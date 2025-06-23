//
//  GradientView.swift
//  HeadShot
//
//  Created by Chris Chuah on 6/16/25.
//

import SwiftUI

struct GradientView: View {
    @State private var isAnimating = false

    let colors1 = (0..<9).map { _ in [Color.blue, .yellow, .cyan, .green]
        .randomElement()! }
    let colors2 = (0..<9).map { _ in [Color.blue, .yellow, .cyan, .green]
        .randomElement()! }

    var body: some View {
        GeometryReader { geometry in
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                    .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                    .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1),
                ],
                colors: isAnimating ? colors1 : colors2
            )
            .frame(width: geometry.size.width, height: geometry.size.height)
            .ignoresSafeArea()
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 100).repeatForever()) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    GradientView()
}
