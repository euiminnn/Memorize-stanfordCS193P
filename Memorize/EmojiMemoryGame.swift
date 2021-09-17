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
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["✈️", "🚄", "🚀", "🏍", "🚕", "🚌", "🚙", "🚲", "🛴", "🛶", "🚁", "⛴", "🛻", "🚔", "🛺", "🚒", "🛸", "⛵️", "🚃", "🚂", "🚍", "🚚", "🚡", "🛵"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    @Published private var model = createMemoryGame()  //initialize
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        //objectWillChange.send()       //Use this or @Published
        model.choose(card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
