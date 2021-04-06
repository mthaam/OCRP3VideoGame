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
//        while fight.isOver == false {
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
            
            print("\n\nTime to play! Now just press enter to know who the Great Spirit has chosen to play first.")
            
            fight.chooseRandomFirstPlayer(in: playersArray)
            
            var fightCounter: Int = 0
            while playersArray[0].atLeastOneCharacterInTeamIsAlive == true || playersArray[1].atLeastOneCharacterInTeamIsAlive == true  {
                fightCounter += 1
                print("\nFight \(fightCounter)")
                if  playersArray[0].isItPlayersTurn == true {
                    playersArray[0].attack(againstTeam: playersArray[1].team)
                    playersArray[1].isItPlayersTurn.toggle()
                } else {
                    playersArray[1].attack(againstTeam: playersArray[0].team)
                    playersArray[0].isItPlayersTurn.toggle()
                }
                
            }
//        }
        
        print("Goodbye Players!")

        
    }
    
/*
     add a run counter and a display team stats function after each run!
     add a message in receiveHit() that says oops you killed xx the xxx + code that removes character from team?
     */
    
    
    

}
