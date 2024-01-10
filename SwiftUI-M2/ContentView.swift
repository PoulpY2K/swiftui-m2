//
//  ContentView.swift
//  SwiftUI-M2
//
//  Created by Jérémy Laurent on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    var loot = ["Epée", "Bouclier", "Armure"]
    
    var body: some View {
        List(loot) { item in
            Text(item)
        }
    }
}

#Preview {
    ContentView()
}
