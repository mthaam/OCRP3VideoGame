//
//  Fight.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//


import Foundation

class Fight {
    
    var team: Team
    var player: Player
    var isOver: Bool = false
    var winner: Player
    var chest: Weapon
    
    
    
    
//    var availableWeapons: [Weapon] = Weapon.createWeaponSet()
    
  
    

    
    
    
    
    
    
    init(newTeam: Team, newPlayer: Player, newWinner: Player, newChest: Weapon) {
        self.team = newTeam
        self.player = newPlayer
        self.winner = newWinner
        self.chest = newChest
        
    }
    
    
}
