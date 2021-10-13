//
//  DeckModel.swift
//  Golf
//
//  Created by Michael Baumgarten on 10/9/21.
//

import Foundation

class DeckModel: ObservableObject {
    @Published var cards = [Card]()
    
    let suits: [Character: String] = ["s": "spades",
                                      "c": "clubs",
                                      "d": "diamonds",
                                      "h": "hearts"]
    
    var cardback = "back"
    
    init(cardValues: [Int:Int]){
        for suit in suits.keys {
            for rank in 1...13 {
                let cardimg = suits[suit]! + "_" + String(rank)
                let newCard = Card(id:UUID(), suit:suit, rank:rank, value:cardValues[rank]!, faceup:false, faceimg: cardimg, backimg: cardback, currentimg: cardback)
                cards.append(newCard)
            }
        }
    }
    
    func shuffleCards() {
        self.cards.shuffle()
    }
    
    func dealCard() -> Card {
        return self.cards.remove(at:0)
    }
    
    func returnCard(card:Card) {
        self.cards.append(card)
    }
    
    func returnCards(retCards:[Card]) {
        for card in retCards {
            var tmpcard = card
            tmpcard.setFaceDown()
            self.cards.append(tmpcard)
        }
    }
}
