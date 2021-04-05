//
//  Game.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 19/3/21.
//

import Foundation

//enum PlayerTurn {
//    case playerOneTurn, playerTwoTurn
//}

class Game {
    
    var playersArray: [Player] = []
    var fight: Fight = Fight()
    

    

    func launchGame() {
        
        print("Welcome to Wizard Battle!")
        print("\nPlease enter names for players")
        
        playersArray = Player.createPlayersArray()
        
        print("\nNow please choose a team for each player")
        print("Each player can choose 3 characters for his team")
        
        for player in playersArray {
            player.chooseTeam()
        }
        
        playersArray[1].controlTeamNames(versusTeamOne: playersArray[0].team.team)
        
        print("Congratulations \(playersArray[0].playerName.capitalized) and \(playersArray[1].playerName.capitalized), you are almost ready to fight. Let's review your teams first.")
        
        for player in playersArray {
            player.teamReview()
        }
        
        print("\n\nTime to play! Now just press enter to know who the Great Spirit has chosen to play first.")
        

        
        fight.chooseRandomFirstPlayer(in: playersArray)
        
        while playersArray[0].atLeastOneCharacterInTeamIsAlive == true || playersArray[1].atLeastOneCharacterInTeamIsAlive == true  {
            if  playersArray[0].isItPlayersTurn == true {
                fight.initiateFight()
            } else {
                fight.initiateFight()
            }
            
        }
        
        
        

        

       
    }
    

    
    
    
    
    
    
    
    
    

    

    
    
}
