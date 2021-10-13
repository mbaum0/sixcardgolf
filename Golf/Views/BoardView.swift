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
                        
            VStack {
                Button(action: {
                    game.reset()
                }, label: {
                    Text("Reset").foregroundColor(Color.white)
                })
                HStack {
                    DeckView().frame(maxWidth: .infinity)
                }
                //.frame(width: .infinity, height: 350)
                HStack {
                    PlayerView(player:game.player)
                        .frame(maxWidth: .infinity)
                }
                //.frame(width: .infinity, height: 350)
                
            }
            .frame(width: 350, height: 750)
        }
    }
}

struct PlayerView: View {
    @ObservedObject var player : PlayerModel
    var body: some View {
        VStack {
            HStack {
                ForEach((0...2), id: \.self) { i in
                    CardView(faceup: $player.hand[i].faceup, faceimg: player.hand[i].faceimg, backimg: player.hand[i].backimg)
                        .onTapGesture {
                            player.hand[i].faceup.toggle()
                            player.updateScore()
                        }
                        .rotation3DEffect(player.hand[i].faceup ? Angle(degrees: 180): Angle(degrees:0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                        .animation(.default)
                }
            }
            HStack {
                ForEach((3...5), id: \.self) { i in
                    CardView(faceup: $player.hand[i].faceup, faceimg: player.hand[i].faceimg, backimg: player.hand[i].backimg)
                        .onTapGesture {
                            player.hand[i].faceup.toggle()
                            player.updateScore()
                        }
                        .rotation3DEffect(player.hand[i].faceup ? Angle(degrees: 180): Angle(degrees:0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                        .animation(.default)
                }
            }
            Text("Score: " + String(player.score))
        }
    }
}

struct DeckView: View {
    var body: some View {
        
        HStack {
            Image("back")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width:75)
                .padding(6.0)
                .border(Color.red, width: 3)
            Image("back")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width:75)
                .padding(6.0)
                .border(Color.red, width: 3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
