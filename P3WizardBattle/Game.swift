//
//  Game.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 19/3/21.
//

import Foundation

enum PlayerTurn {
    case playerOneTurn, playerTwoTurn
}

class Game {
    

    func launchGame() {
        
        print("Welcome to Wizard Battle!")
        print("\nPlease enter names for players")
        
        
        let playerArray: [Player] = Player.createPlayerArray()
        
        print("\nNow please choose a team for each player")
        print("Each player can choose 3 characters for his team")
        
        for player in playerArray {
            player.chooseTeam()
        }
        
        playerArray[1].controlTeamNames(versusTeamOne: playerArray[0].team.team)
        
        print("Congratulations players, your almost ready to fight. Let's review your teams first.")
        
        for player in playerArray {
            player.teamReview()
        }
        
        print("\n\nTime to play! Now just press enter to know who the Great Spirit has chosen to play first.")
        
        var fight: Fight = Fight(newPlayers: playerArray)
        
        fight.chooseRandomFirstPlayer()
        

       
    }
    

    
    
    
    
    
    
    
    
    

    

    
    
}
