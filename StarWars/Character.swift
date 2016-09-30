//
//  Character.swift
//  StarWars
//
//  Created by Karim on 29/09/2016.
//  Copyright © 2016 KRS. All rights reserved.
//

import UIKit

struct Character {
    // MARK: Types

    enum Faction {

        case FirstOrder
        case Empire
        case Rebel
        case Jedi
        
        /// A user-presentable name for the faction.
        var name: String {
            switch self {
            case .FirstOrder: return "First Order"
            case .Empire: return "Galactic Empire"
            case .Rebel: return "Rebel Alliance"
            case .Jedi: return "Jedi Faction"
            }
        }
        
        /// Returns the associated image for the faction.
        var image: UIImage {
            let name: String
            switch self {
            case .FirstOrder: name = "firstOrder"
            case .Empire: name = "empire"
            case .Rebel: name = "rebel"
            case .Jedi: name = "jedi"
            }
            
            return UIImage(named: name)!
        }

        /// All factions so that we can present them in a list.
        static let all: [Faction] = [
            .FirstOrder,
            .Empire,
            .Rebel,
            .Jedi
        ]
    }
    
    enum Specie {
        
        case Human
        case Wookie
        case Ewok
        case Zabrak
        case Trooper
        case Hutt
        case Rodian
        case Sand
        case Droid
        case Calamari
        
        
        /// A user-presentable name for the specie.
        var name: String {
            switch self {
            case .Human: return "Human"
            case .Wookie: return "Wookie"
            case .Ewok: return "Ewok"
            case .Zabrak: return "Zabrak"
            case .Trooper: return "Storm Trooper"
            case .Hutt: return "Hutt"
            case .Rodian: return "Rodian"
            case .Sand: return "Sand Pople"
            case .Droid: return "Droid"
            case .Calamari: return "Calamari"

            }
        }
        
        /// Returns the associated image for the specie.
        var image: UIImage {
            let name: String
            switch self {
            case .Human: name = "human"
            case .Wookie: name = "wookie"
            case .Ewok: name = "ewok"
            case .Zabrak: name = "zabrak"
            case .Trooper: name = "trooper"
            case .Hutt: name = "hutt"
            case .Rodian: name =  "rodian"
            case .Sand: name = "sand"
            case .Droid: name = "droid"
            case .Calamari: name = "calamari"
            }
            
            return UIImage(named: name)!
        }
        
        /// All specie so that we can present them in a list.
        static let all: [Specie] = [
            .Human,
            .Wookie,
            .Ewok,
            .Zabrak,
            .Trooper,
            .Hutt,
            .Rodian,
            .Sand,
            .Droid,
            .Calamari
        ]
    }
    
    // MARK: Properties
    var name: String
    var specie: Specie
    var faction: Faction

    
    init(name: String, specie: Specie, faction: Faction) {
        self.name = name
        self.specie = specie
        self.faction = faction
    }
}
