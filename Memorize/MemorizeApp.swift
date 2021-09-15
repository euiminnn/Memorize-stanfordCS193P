//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Euimin Chung on 2021/09/13.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()    //free init of class, only when does nothing
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
