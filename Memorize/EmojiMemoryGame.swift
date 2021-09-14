//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Euimin Chung on 2021/09/14.
//

import SwiftUI

//func makeCardContent(index: Int) -> String {
//    return "🥰"
//}

class EmojiMemoryGame {
    static let emojis = ["✈️", "🚄", "🚀", "🏍", "🚕", "🚌", "🚙", "🚲", "🛴", "🛶", "🚁", "⛴", "🛻", "🚔", "🛺", "🚒", "🛸", "⛵️", "🚃", "🚂", "🚍", "🚚", "🚡", "🛵"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
