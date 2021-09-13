//
//  ContentView.swift
//  Memorize
//
//  Created by Euimin Chung on 2021/09/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("Hello, Devloper Euimin!")
                .foregroundColor(.black)
        }
        .padding(.horizontal)
        .foregroundColor(.blue)

            
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
