//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Euimin Chung on 2021/09/14.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["✈️", "🚄", "🚀", "🏍", "🚕", "🚌", "🚙", "🚲", "🛴", "🛶", "🚁", "⛴", "🛻", "🚔", "🛺", "🚒", "🛸", "⛵️", "🚃", "🚂", "🚍", "🚚", "🚡", "🛵"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    @Published private var model = createMemoryGame()
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
