//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Noalino on 14/03/2024.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: proxy.frame(in: .global).minY / fullView.size.height, saturation: 0.85, brightness: 1.0))
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(min(200.0, proxy.frame(in: .global).minY) / 200.0)
                            .scaleEffect(max(0.5, proxy.frame(in: .global).minY / fullView.size.height))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
