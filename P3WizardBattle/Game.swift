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
    
    var isOver: Bool = false
    var playersArray: [Player] = []
    var fight: Fight = Fight()
    
    
    
    
    func gameManager() {
        while isOver == false {
            launchGame()
            battle()
        }
        
        print("Goodbye Players!")
    }
    
    
    private func launchGame() {
        print("⚔️ Welcome to Wizard Battle! ⚔️")
        print("\nPlease enter names for players")
        
        playersArray = Player.createPlayersArray()
        
        print("\nNow please choose a team for each player 👨‍👨‍👦")
        print("Each player can choose 3️⃣ characters for his team")
        
        for player in playersArray {
            player.chooseTeam()
        }
        
        playersArray[1].controlTeamNames(versusTeamOne: playersArray[0].team.aliveCharacters)
        
        print("\n\n\(playersArray[0].playerName.capitalized) and \(playersArray[1].playerName.capitalized), you are almost ready to fight. Let's review your teams first.")
        
        for player in playersArray {
            player.teamReview()
        }
    }
    
    
    private func battle() {
        fight.initiateFight(withPlayers: playersArray)
        fight.winner(in: playersArray)
    }
    
    
    
    /*
     add a displayFIghtStats() function
     */
    
    /*
     private func startANewGame? linked to isOver
     */
    
    
    
    
}
