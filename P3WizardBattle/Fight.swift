//
//  Fight.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//


import Foundation

class Fight {
    
//    var team: Team
    var players: [Player]
    var isOver: Bool = false
    var winner: Player!
    var chest: Weapon!
    
    
    
    
//    var availableWeapons: [Weapon] = Weapon.createWeaponSet()
    
  
    
    init(newPlayers: [Player]) {
        self.players = newPlayers
    }
    
    
    func chooseRandomFirstPlayer() {
        let randomNumber: Int = Int.random(in: 1...2)
        _ = readLine()

        if randomNumber == 1 {
            print("\nThe Great Spirit has chosen you \(players[0].playerName.capitalized), you will start the fight!")
            players[0].isItPlayersTurn = true
            
        } else {
            print("\nThe Great Spirit has chosen you \(players[1].playerName.capitalized), you will start the fight!")
            players[1].isItPlayersTurn = true
        }
    }
    
    
}
