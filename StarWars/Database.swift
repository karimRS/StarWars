//
//  Database.swift
//  StarWars
//
//  Created by Karim on 29/09/2016.
//  Copyright © 2016 KRS. All rights reserved.
//

import Foundation

class Database {
    
    static var sharedInstance = Database()
    
    lazy var rebels: [Character] =
        [Character(name: "Luke", specie: .Human, faction: .Rebel),
         Character(name: "Chewbacca", specie: .Ewok, faction: .Rebel),
         Character(name: "C3PO", specie: .Droid, faction: .Rebel)]
    
    lazy var jedis: [Character] =
        [Character(name: "jedi", specie: .Rodian, faction: .Jedi),
         Character(name: "jedi2", specie: .Calamari, faction: .Jedi),
         Character(name: "jedi3", specie: .Sand, faction: .Jedi)]
    
    lazy var empires: [Character] =
        [Character(name: "Trooper1", specie: .Trooper, faction: .Empire),
         Character(name: "Trooper2", specie: .Trooper, faction: .Empire),
         Character(name: "Dark Mauth", specie: .Zabrak, faction: .Empire)]
    
    lazy var firstOrders: [Character] =
        [Character(name: "order", specie: .Human, faction: .FirstOrder),
         Character(name: "order", specie: .Human, faction: .FirstOrder),
         Character(name: "order", specie: .Human, faction: .FirstOrder)]

    
}
