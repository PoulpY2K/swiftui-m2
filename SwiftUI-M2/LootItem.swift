    //
    //  LootItem.swift
    //  SwiftUI-M2
    //
    //  Created by Jérémy Laurent on 10/01/2024.
    //

    import Foundation
    import SwiftUI

    enum Rarity: String, CaseIterable {
        case common, uncommon, rare, epic, legendary, unique
    }

    extension Rarity {
        var color: Color {
            switch self {
            case .common:
                return .gray
            case .uncommon:
                return .green
            case .rare:
                return .blue
            case .epic:
                return .pink
            case .legendary:
                return .orange
            case .unique:
                return .red
            }
        }
    }

    enum ItemType: String, CaseIterable {
        case magic = "⭐️"
        case fire = "🔥"
        case ice = "❄️"
        case wind = "💨"
        case poison = "☠️"
        case thunder = "⚡️"
        case dagger = "🗡️"
        case shield = "🛡️"
        case bow = "🏹"
        case ring = "💍"
        case unknown = "🎲"
    }

    struct LootItem: Identifiable {
        var id: UUID = UUID()
        var quantity: Int
        var name: String
        var type: ItemType
        var rarity: Rarity
        var atkStrength: Int?
        var dfsStrength: Int?
        var game: Game
    }
