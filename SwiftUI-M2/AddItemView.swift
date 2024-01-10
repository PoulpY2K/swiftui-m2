//
//  ContentView.swift
//  SwiftUI-M2
//
//  Created by Jérémy Laurent on 10/01/2024.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) var dismiss
    
    @State private var quantity = 1
    @State private var name = ""
    @State private var type : ItemType = .magic
    @State private var rarity : Rarity = .common
    @State private var isLethal : Bool = false
    @State private var atkStrength: Int = 1
    @State private var dfsStrength: Int = 1
    @State private var game: Game = .emptyGame
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rareté", selection: $rarity) {
                    ForEach(Rarity.allCases, id:\.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $game) {
                    Text("Non spécifié").tag(Game.emptyGame)
                    
                    ForEach(availableGames) {
                        availableGame in Text(availableGame.name).tag(availableGame)
                    }
                }
                Stepper(value: $quantity, in: 1...20, step: 1) {
                    Text("Combien ? \(quantity)")
                }
            }
            Section {
                HStack {
                    Text("Type")
                    Spacer()
                    Text(type.rawValue)
                }
                Picker("Type", selection: $type) {
                    ForEach(ItemType.allCases, id:\.self) {
                        lootType in Text(lootType.rawValue)
                    }
                    
                }.pickerStyle(.palette)
            }
            Section {
                Toggle("Item d'attaque ?", isOn: $isLethal)
                if isLethal {
                    Stepper(value: $atkStrength, in: 1...50, step: 1) {
                        Text("Force d'attaque: \(atkStrength)")
                    }
                    Stepper(value: $dfsStrength, in: 1...50, step: 1) {
                        Text("Défense:  \(dfsStrength)")
                    }
                }
            }
            Button(action: {
                inventory.addItem(item: LootItem(quantity: quantity, name: name, type: type, rarity: rarity, atkStrength: isLethal ? atkStrength : nil, dfsStrength: isLethal ? dfsStrength : nil, game: game))
                dismiss()
            }, label: {
                HStack {
                    Image(systemName: "plus.app.fill")
                    Text("Ajouter")
                }
            })
        }
    }
}

#Preview {
    AddItemView()
}
