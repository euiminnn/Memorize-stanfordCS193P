import Foundation

struct Card: Identifiable {
    var id: Int
    
    var isFaceUp = true
    var isMatched = false
}

var cards: Array<Card> = [Card]()

let name = cards.indices.filter({index in cards[index].isFaceUp})

//these 6 lines(L16~21) into 1 line(L12)

//var name = [Int]()
//for index in cards.indices {
//    if cards[index].isFaceUp {
//        name.append(index)
//    }
//}
