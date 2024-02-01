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
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Text(item.type.rawValue)
                        .font(.largeTitle)
                        .padding(20)
                        .background(Gradient(colors: [item.rarity.color.opacity(0.4), item.rarity.color]))
                        .cornerRadius(16)
                        .shadow(color:item.rarity.color, radius: 30)
                    Text(item.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(item.rarity.color)
                        .padding()
                }
            }
            .frame(maxHeight: .infinity)
            .padding()
            
            if item.rarity == .unique {
                HStack {
                    Text("Item Unique 🏆")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Gradient(colors: [item.rarity.color.opacity(0.7), item.rarity.color]))
                        .cornerRadius(16)
                }.padding()
            }
            
            HStack {
                Spacer()
                VStack {
                    HStack{
                        Text("Informations").textCase(.uppercase).font(.footnote).foregroundStyle(.secondary)
                        Spacer()
                    }.padding(.horizontal)
                    VStack {
                        HStack {
                            if let cover = item.game.coverName, let image = UIImage(named: cover) {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 58)
                                    .cornerRadius(4)
                            } else {
                                Rectangle()
                                    .frame(width: 40, height:58)
                                    .foregroundStyle(.clear)
                                    .background(Gradient(colors: [.gray.opacity(0.4)]))
                                    .overlay(
                                        Image(systemName: "rectangle.slash").padding()
                                    )
                                    .cornerRadius(4)
                            }
                            Text(item.game.name)
                            Spacer()
                        }
                        Divider()
                        HStack {
                            Text("In-game: \(item.name)")
                            Spacer()
                        }
                        Divider()
                        if let atkStrength = item.atkStrength {
                            HStack {
                                Text("Puissance (ATQ): \(atkStrength)")
                                Spacer()
                            }
                            Divider()
                        }
                        if let dfsStrength = item.dfsStrength {
                            HStack {
                                Text("Défense (DFS): \(dfsStrength)")
                                Spacer()
                            }
                            Divider()
                        }
                        HStack {
                            Text("Possédé(s): \(item.quantity)")
                            Spacer()
                        }
                        Divider()
                        HStack {
                            Text("Rareté: \(item.rarity.rawValue.capitalized)")
                            Spacer()
                        }
                    }.padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .padding()
            .background(Color(UIColor.systemGroupedBackground))
        }
        .frame(maxHeight: .infinity)
        .background(.white)
    }
}

#Preview {
    LootDetailView(item: LootItem(quantity: 3, name: "Épée de Feu", type: .dagger, rarity: .unique, atkStrength: 35, game: availableGames[0]))
}
