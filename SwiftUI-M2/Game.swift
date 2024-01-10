//
//  Game.swift
//  SwiftUI-M2
//
//  Created by Jérémy Laurent on 10/01/2024.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "elden"),
    Game(name: "Skyrim", genre: .rpg, coverName: "skyrim"),
    Game(name: "Cyberpunk 2077", genre: .rpg, coverName: "cyberpunk"),
    Game(name: "Minecraft", genre: .rpg, coverName: "minecraft"),
    Game(name: "Diablo IV", genre: .looter, coverName: "diablo")
]
