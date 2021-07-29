//
//  ContentView.swift
//  BrokenNavigationLink
//
//  Created by Jakub Kozlowicz on 01.06.21.
//

import SwiftUI

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}


struct Item {
    var id: UUID = UUID()
    var label: String
    var description: String
}



struct DetailView: View {
    var item: Item
    
    var body: some View {
        VStack(spacing: 15) {
            Text(item.label)
                .foregroundColor(.blue)
                .bold()
                .font(.title)
            
            Text(item.description)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct DetailViewCard: View {
    var label: String
    
    var body: some View {
        Text(label)
            .foregroundColor(.blue)
            .bold()
    }
}


struct ContentView: View {
    let items: [Item] = (0...20).map { _ in
        Item(label: randomString(length: 15), description: randomString(length: 50))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 15) {
                    ForEach(items, id: \.id) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            DetailViewCard(label: item.label)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Items")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
