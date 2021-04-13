//
//  Game.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 19/3/21.
//

import Foundation

class Game {
    
    var isOver: Bool = false
    var playersArray: [Player] = []
    var fight: Fight = Fight()
    
    
    
    
    func gameManager() {
        while isOver == false {
            launchGame()
            battle()
            exitOrNewGame()
        }
    }
    
    
    private func launchGame() {
        print("\n⚔️ Welcome to Wizard Battle! ⚔️")
        print("\nPlease enter names for players")
        
        playersArray = Player.createPlayersArray()
        
        print("\nNow please choose a team for each player 👨‍👨‍👦")
        print("Each player can choose 3️⃣ characters for his team")
        
        for player in playersArray {
            player.chooseTeam()
        }
        
        print("\n\n\(playersArray[0].playerName.capitalized) and \(playersArray[1].playerName.capitalized), you are almost ready to fight. Let's review your teams first.")
        
        for player in playersArray {
            player.teamReview()
        }
    }
    
    
    private func battle() {
        fight.initiateFight(withPlayers: playersArray)
        fight.winner(in: playersArray)
        fight.displayBattleFinalStats(in: playersArray)
    }
    
    private func exitOrNewGame() {
        print("\n\nWhat would you like to do now?\n\n- Enter 1 to start a new game\n\n- Enter 2 to exit game")
        let choice = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: 2, errorMessage: "❌ You can only answer with 1 to start a new game, or 2 to exit game. Please try again.")
        if choice == 1 {
            playersArray.removeAll()
            UserFunctions.usedCharacterNames.removeAll()
            UserFunctions.usedPlayerNames.removeAll()
        } else {
            print("Goodbye! 👋")
            isOver = true
        }
    }

    
    
    
    
    
    
}
