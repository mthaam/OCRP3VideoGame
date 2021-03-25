//
//  Player.swift
//  P3WizardBattle
//
//  Created by SEBASTIEN BRUNET on 23/03/2021.
//

import Foundation

class Player {
    var playerName: String
    var playerScore: Int
    var team: Team
    
    init(newPlayerName: String, newPlayerScore: Int, newTeam: Team) {
        self.playerName = newPlayerName
        self.playerScore = newPlayerScore
        self.team = newTeam
    }
    
    
}
