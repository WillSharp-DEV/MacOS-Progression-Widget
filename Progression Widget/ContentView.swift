//
//  ContentView.swift
//  Progression Widget
//
//  Created by William Sharp on 1/15/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack{
            Text("Please edit the Widget variables to start your counter!")
                .font(.largeTitle)
            Text("Place your widget anywhere, hold down the widget and enter a start and end date!")
                .font(Font.largeTitle.bold())
        }.padding(20)
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
