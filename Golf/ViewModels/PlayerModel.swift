//
//  PlayerModel.swift
//  Golf
//
//  Created by Michael Baumgarten on 10/9/21.
//

import Foundation

class PlayerModel: ObservableObject {
    @Published var hand = [Card]()
    
    func getCard(card:Card) {
        self.hand.append(card)
    }
    
    func retCard(card:Card) -> Card {
        let index = self.hand.firstIndex(where: {$0.id == card.id});
        return self.hand.remove(at: index!)
    }
}
