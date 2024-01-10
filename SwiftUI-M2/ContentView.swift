//
//  ContentView.swift
//  SwiftUI-M2
//
//  Created by Jérémy Laurent on 10/01/2024.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(quantity: 3, name: "Épée de Feu", type: .dagger, rarity: .rare, atkStrength: 35, dfsStrength: nil, game: availableGames[0]),
        LootItem(quantity: 1, name: "Arc de Glace", type: .bow, rarity: .epic, atkStrength: 42, dfsStrength: nil, game: availableGames[1]),
        LootItem(quantity: 5, name: "Anneau de Tonnerre", type: .ring, rarity: .common, atkStrength: nil, dfsStrength: 20, game: availableGames[2]),
        LootItem(quantity: 2, name: "Dague Empoisonnée", type: .dagger, rarity: .legendary, atkStrength: 48, dfsStrength: nil, game: availableGames[3]),
        LootItem(quantity: 1, name: "Bouclier de Vent", type: .shield, rarity: .unique, atkStrength: nil, dfsStrength: 28, game: availableGames[4]),
        LootItem(quantity: 4, name: "Hache Molténienne", type: .fire, rarity: .uncommon, atkStrength: 38, dfsStrength: nil, game: availableGames[0]),
        LootItem(quantity: 2, name: "Bâton de Givre", type: .magic, rarity: .common, atkStrength: 30, dfsStrength: nil, game: availableGames[2]),
        LootItem(quantity: 3, name: "Dague Épique", type: .dagger, rarity: .epic, atkStrength: 45, dfsStrength: nil, game: availableGames[3]),
        LootItem(quantity: 1, name: "Bouclier Légendaire", type: .shield, rarity: .legendary, atkStrength: nil, dfsStrength: 35, game: availableGames[4]),
        LootItem(quantity: 2, name: "Arc Unique", type: .bow, rarity: .unique, atkStrength: 50, dfsStrength: nil, game: availableGames[1])
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var addItemSheetPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
                        HStack {
                            Text(item.type.rawValue)
                                .font(.largeTitle)
                                .padding()
                                .background(item.rarity.color)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Text("Quantity: \(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }.sheet(isPresented: $addItemSheetPresented, content: {
                AddItemView().environmentObject(inventory)
            }).navigationBarTitle("💼 Inventaire")
                .toolbar(content: {
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            addItemSheetPresented.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "plus.app.fill")
                                Text("Ajouter")
                            }
                        })
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}
