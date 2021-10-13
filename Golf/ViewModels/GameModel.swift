//
//  GameModel.swift
//  Golf
//
//  Created by Michael Baumgarten on 10/9/21.
//

import Foundation

class GameModel: ObservableObject {
    
    // the point value of each card
    let cardValues: [Int: Int] = [
        1:1,
        2:2,
        3:3,
        4:4,
        5:5,
        6:6,
        7:7,
        8:8,
        9:9,
        10:10,
        11:10,
        12:10,
        13:0
    ]
    
    @Published var deck: DeckModel
    @Published var player: PlayerModel

    
    init() {
        self.deck = DeckModel(cardValues:cardValues)
        self.player = PlayerModel()
        self.deck.shuffleCards()
        
        for _ in 0...5 {
            self.player.getCard(card:deck.dealCard())
        }
    }
    
    func reset() {
        self.deck.returnCards(retCards: self.player.returnAllCards())
        self.player.updateScore()
        self.deck.shuffleCards()
        
        for _ in 0...5 {
            self.player.getCard(card:deck.dealCard())
        }
    }
    
}
