//
//  ContentView.swift
//  Memorize
//
//  Created by Euimin Chung on 2021/09/13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
//    @State var emojiCount = 24   //@State to get rid of error "Self is immutable"
    
    var body: some View {
        //VStack {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card0: card)
                        .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
//    var removeButton: some View {
//        Button(action: {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        }, label: {
//            Image(systemName: "minus.circle")   //color is blue as system default
//        })
//    }
//
//    var addButton: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct CardView: View {
    let card0: MemoryGame<String>.Card
    
//    var content: String
//
//    @State var isFaceUp: Bool = true
    //var isFaceUp: Bool {return true} //if cardview has no arguments

    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card0.isFaceUp {
                shape.fill(Color.white)
    //                .fill()
    //                .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card0.content0).font(.largeTitle)
            } else if card0.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
//        .onTapGesture {
//            isFaceUp = !isFaceUp
//        }
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
