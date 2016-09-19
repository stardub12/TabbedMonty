//
//  MontyEngine.swift
//  Monty
//
//  Created by Jason Gresh on 9/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation


class MontyBrain {
    let numCards: Int
    
    init(numCards:Int){
        self.numCards = numCards
        setupCards()
    }
    
    fileprivate enum State{
        case hit
        case miss
    }
    
    private  var cards = [State]()
    
    func setupCards(){
            cards = Array(repeating: .miss, count: numCards)
        for i in 1...5 {
             cards[Int(arc4random_uniform(UInt32(numCards)))] = .hit
        }
        
    }
    
    func checkCard(_ cardIn: Int) -> Bool{
        assert(cardIn < cards.count)  //helps with debugging
        return cards[cardIn] == .hit
    }
    
    //code to test later
    
    //    func hit(hit: State.hit) -> [Int] {
    //        return (1...100).map{_ in arc4random()}
    //    }
    
    //    let randomNum = Int(arc4random_uniform(UInt32(100)))
    //    //Determines ship size
    //    enum shipSize: [Int] {
    //    case Small = [randomNum, randomNum + 1]
    //    case Medium = [randomNum, randomNum + 1, randomNum + 2]
    //    case Large = [randomNum, randomNum + 1, randomNum + 2, randomNum + 3]
    //    case XL = [randomNum, randomNum + 1, randomNum + 2, randomNum + 3, randomNum + 4]
    //    }
    //
    //    var ships = [shipSize.Small, .Medium, .Large, .XL]
    
//    //Determines ship orientation
//    enum shipLayout {
//        case Horizontal
//        case Vertical
//        case DiagonalLeft
//        case DiagonalRight
//    }
    
//    func RandomGridLocation() -> GridLocation {
//        let randomX = Int(arc4random_uniform(UInt32(width)))
//        let randomY = Int(arc4random_uniform(UInt32(height)))
//        return GridLocation(x: randomX, y: randomY)
//    }
//
//    start & end
//    func ShipEndLocation(_ ship: Ship) -> GridLocation {
//        return ship.isVertical ? GridLocation(x: ship.location.x, y: ship.location.y + ship.length - 1) : GridLocation(x: ship.location.x + ship.length - 1, y: ship.location.y)
//    }
}
