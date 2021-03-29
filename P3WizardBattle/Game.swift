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
        print("Please enter names for players")
        
        
        let playerArray: [Player] = Player.createPlayerArray()
        
        print("Now please choose a team for each player")
        print("Each player can choose 3 characters for his team")
        
        print("Please choose characters for player \(playerArray.first!.playerName)")
        
        
        
        
        
        
        for player in playerArray {
            var team: [Team] = []
            let availableCharacters = Character.displayAvailableCharacters()
            for character in availableCharacters {
                print(character.characterType)
            }
            repeat {
                
            } while team.count < 3
            
        }
        


       
        
    }
    
    
    
    
    
    
    
    
    

    

    
    
}
