//
//  PlayerModel.swift
//  Golf
//
//  Created by Michael Baumgarten on 10/9/21.
//

import Foundation

class PlayerModel: ObservableObject {
    @Published var hand = [Card]()
    @Published var score = 0
    
    func getCard(card:Card) {
        self.hand.append(card)
    }
    
    func retCard(card:Card) -> Card {
        let index = self.hand.firstIndex(where: {$0.id == card.id});
        return self.hand.remove(at: index!)
    }
    
    func returnAllCards() -> [Card] {
        var remCards = [Card]()
        for card in self.hand {
            remCards.append(card)
        }
        self.hand.removeAll()
        return remCards
    }
    
    func updateScore() {
        var tmpscore = 0
        
        for (index, card) in self.hand.enumerated(){
            let pairIndex = index >= 3 ? index-3 : index+3
            let pairCard = self.hand[pairIndex]
            
            if !card.faceup {
                // if this card isn't faceup, go to next card
                continue
            }
            
            if !pairCard.faceup {
                // if the pair card isn't faceup, add in the value
                tmpscore += card.value
                continue
            }
            
            if card.rank == pairCard.rank {
                // if ranks are equal, they cancel out
                continue
            }
            
            // add in the card value in any other case
            tmpscore += card.value
        }
        
        self.score = tmpscore
    }
}
