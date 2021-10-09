//
//  ContentView.swift
//  Golf
//
//  Created by Michael Baumgarten on 10/9/21.
//

import SwiftUI

struct BoardView: View {
    @StateObject var game = GameModel()
    var body: some View {        
        ZStack {
            Image("background").ignoresSafeArea()
            PlayerView(player: game.player)

        }
    }
}

struct PlayerView: View {
    @ObservedObject var player : PlayerModel
    var body: some View {
        VStack {
            HStack {
                ForEach((0...2), id: \.self) { i in
                    Button(action: {
                        self.player.hand[i].flip()
                    }, label: {
                        Image(self.player.hand[i].currentimg)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:75)
                    })
                }
            }
            HStack {
                ForEach((3...5), id: \.self) { i in
                    Button(action: {
                        self.player.hand[i].flip()
                    }, label: {
                        Image(self.player.hand[i].currentimg)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:75)
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}

//Button(action: {
//    self.game.player.hand[($0)].flip()
//}, label: {
//    Image(self.game.player.hand[($0].currentimg)
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .frame(width: 75)
//})
