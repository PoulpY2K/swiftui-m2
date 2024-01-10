//
//  LootDetailView.swift
//  SwiftUI-M2
//
//  Created by Jérémy Laurent on 10/01/2024.
//

import SwiftUI

struct LootDetailView: View {
    @State var item: LootItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.name)
                    .font(.title)
                    .padding()
                
                Spacer()
                
                // Affiche l'icône de rareté dans un carré stylisé
                Text("Test")
                    .font(.title)
                    .frame(width: 30, height: 30)
                    .foregroundColor(item.rarity.color)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding()
            }
            
            Divider()
            
            // Résumé des informations
            Text("Quantité: \(item.quantity)")
                .padding()
            
            Text("Type: \(item.type.rawValue)")
                .padding()
            
            Text("Rareté: Test")
                .padding()
            
            if let atkStrength = item.atkStrength {
                Text("Force d'attaque: \(atkStrength)")
                    .padding()
            }
            
            if let dfsStrength = item.dfsStrength {
                Text("Force de défense: \(dfsStrength)")
                    .padding()
            }
            
            Divider()
            
            Text("Jeu Associé: \(item.game.name)")
                .font(.headline)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Détails de l'objet")
    }
}
