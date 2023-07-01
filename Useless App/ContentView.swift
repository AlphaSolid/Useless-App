//
//  ContentView.swift
//  Useless App
//
//  Created by Marcus Low on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PenguinCustomizer()
                .tabItem {
                    Label("Pengiun Customiser", systemImage: "bolt.circle")
                }
            FlashbangView()
                .tabItem {
                    Label("No need to know", systemImage: "sun.max.fill")
                }
        }
        .tabViewStyle(.page)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
