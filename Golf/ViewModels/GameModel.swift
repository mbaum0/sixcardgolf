//
//  GameModel.swift
//  Golf
//
//  Created by Michael Baumgarten on 10/9/21.
//

import Foundation

class GameModel: ObservableObject {
    @Published var deck = DeckModel()
    @Published var player = PlayerModel()
    
    init() {
        self.deck.shuffleCards()
        
        for _ in 0...5 {
            self.player.getCard(card:deck.dealCard())
        }
    }
    
}
