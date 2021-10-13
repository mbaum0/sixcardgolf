//
//  Card.swift
//  Golf
//
//  Created by Michael Baumgarten on 10/9/21.
//

import Foundation

struct Card: Identifiable {
    var id:UUID
    var suit:Character
    var rank:Int
    var value:Int
    var faceup:Bool
    var faceimg:String
    var backimg:String
    var currentimg:String
    
    mutating func flip() {
        self.faceup = !self.faceup
        self.currentimg = self.faceup ? self.faceimg : self.backimg
    }
    
    mutating func setFaceDown() {
        self.faceup = false
        self.currentimg = self.backimg
    }
    
    mutating func setFaceUp() {
        self.faceup = true
        self.currentimg = self.faceimg
    }
}
