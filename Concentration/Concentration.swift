//
//  Concentration.swift
//  Concentration
//
//  Created by Almat Alibekov on 19.07.2022.
//

import Foundation
import UIKit

class Concentration {
    
    var cards = [Card]()
    
    var indexOfAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfAndOnlyFaceUpCard = index
                
            }
        }
    }
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
            cards.shuffle()
        }
         
        // TODO: Shuffle the cards
        
        
    }
}
