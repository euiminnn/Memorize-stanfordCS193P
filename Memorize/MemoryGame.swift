//
//  MemoryGame.swift
//  Memorize
//
//  Created by Euimin Chung on 2021/09/14.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{ //when can't use '=='
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
//        if let chosenIndex = index(of: card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {      //index 함수 사용 대신 이렇게
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content0 == cards[potentialMatchIndex].content0 {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOnlyFaceUpCard = nil
            } else {
                for index in 0..<cards.count {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }

    }
    
//    func index(of: Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == of.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards * 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content0: content))      //*2 to make id unique
            cards.append(Card(id: pairIndex*2+1, content0: content))    //*2+1 to make id unique
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp = false
        var isMatched = false
        var content0: CardContent
    }
}
