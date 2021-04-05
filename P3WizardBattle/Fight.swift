//
//  Fight.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//


import Foundation

class Fight {
    

    var isOver: Bool = false
    var winner: Player!
    var availableWeapons: [Weapon] = Weapon.createWeaponSet()
    var chest: Weapon!
    
    
    func chooseRandomFirstPlayer(in playersArray: [Player]) {
        let randomNumber: Int = Int.random(in: 1...2)
        _ = readLine()

        if randomNumber == 1 {
            print("\nThe Great Spirit has chosen you \(playersArray[0].playerName.capitalized), you will start the fight!")
            playersArray[0].isItPlayersTurn = true
            
        } else {
            print("\nThe Great Spirit has chosen you \(playersArray[1].playerName.capitalized), you will start the fight!")
            playersArray[1].isItPlayersTurn = true
        }
    }
    
    func initiateFight() {
        
    }
    
    
}
