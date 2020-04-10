//
//  PlayingCard.swift
//  PlayingCardDemo
//
//  Created by Jefferson Qin on 2020/3/30.
//  Copyright © 2020 Jefferson Qin. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String {
        return "\(rank)\(suit)"
    }
    
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        
        var description: String { return rawValue }
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.spades, .hearts, .clubs, .diamonds]
    }
    
    enum Rank: CustomStringConvertible {

        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let pip): return "\(pip)"
            case .face(let face): return face
            }
        }
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pip): return pip
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks: [Rank] = [.ace]
            for i in 2...10 {
                allRanks.append(Rank.numeric(i))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
        
    }
    
}
