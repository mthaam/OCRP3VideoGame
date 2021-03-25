//
//  Player.swift
//  P3WizardBattle
//
//  Created by SEBASTIEN BRUNET on 23/03/2021.
//

import Foundation

class Player {
    var playerName: String
    var playerScore: Int = 0
    
    init(newPlayerName: String) {
        self.playerName = newPlayerName
    }
    
    convenience init(newPlayerName: String, newPlayerScore: Int) {
        self.init(newPlayerName: newPlayerName)
        self.playerScore = newPlayerScore
    }
    
}
