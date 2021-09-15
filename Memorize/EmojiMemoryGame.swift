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

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["✈️", "🚄", "🚀", "🏍", "🚕", "🚌", "🚙", "🚲", "🛴", "🛶", "🚁", "⛴", "🛻", "🚔", "🛺", "🚒", "🛸", "⛵️", "🚃", "🚂", "🚍", "🚚", "🚡", "🛵"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()  //initialize
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        //objectWillChange.send()       //Use this or @Published
        model.choose(card)
    }
}
