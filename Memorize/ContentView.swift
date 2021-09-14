//
//  ContentView.swift
//  Memorize
//
//  Created by Euimin Chung on 2021/09/13.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["✈️", "🚄", "🚀", "🏍", "🚕", "🚌", "🚙", "🚲", "🛴", "🛶", "🚁", "⛴", "🛻", "🚔", "🛺", "🚒", "🛸", "⛵️", "🚃", "🚂", "🚍", "🚚", "🚡", "🛵"]
    @State var emojiCount = 24   //@State to get rid of error "Self is immutable"
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeButton
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)   //add some space to both sides
        }
        .padding(.horizontal)
    }
    
    var removeButton: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")   //color is blue as system default
        })
    }
    
    var addButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    
    var content: String
    
    @State var isFaceUp: Bool = true
    //var isFaceUp: Bool {return true} //if cardview has no arguments

    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(Color.white)
    //                .fill()
    //                .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
