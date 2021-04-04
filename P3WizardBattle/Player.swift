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
    var team: Team!
    var isItPlayersTurn: Bool = false
    
    
    
    init(newPlayerName: String) {
        self.playerName = newPlayerName
    }
    
    convenience init(newPlayerName: String, newPlayerScore: Int) {
        self.init(newPlayerName: newPlayerName)
        self.playerScore = newPlayerScore
    }
    
    
    static func createPlayerArray() -> [Player] {
        var playerArray: [Player] = []
        repeat {
            for count in 1...2 {
                print("Now enter name for player \(count) and press Enter")
                playerArray.append(Player(newPlayerName: UserFunctions.askNameForPlayer()))
            }

        } while playerArray.count < 2
        
        for _ in playerArray {
            if playerArray.first?.playerName == playerArray.last?.playerName {
                print("Players have identical names. Please change name for Player 2")
                playerArray.last?.playerName = UserFunctions.askNameForPlayer()
            }
        }
        return playerArray
    }
    
    
    func chooseTeam() {
        print("\n\nPlease choose characters for player \(playerName.capitalized)")
        team = Team.chooseCharactersForPlayersTeam()
        print("\nCongratulations \(playerName.capitalized), your team is all set!")
    }
    
    func teamReview() {
        print("\n\(playerName.capitalized), Your team now has the following characters")
        for character in team.team {
            print(" \(character.characterName!) the \(character.characterType)")
        }
    }
    
    func controlTeamNames(versusTeamOne: [Character]) {
        let teamOne = versusTeamOne
        
        for character in self.team.team {
            if character.characterName == teamOne[0].characterName || character.characterName == teamOne[1].characterName || character.characterName == teamOne[2].characterName  {
                print("Your character \(character.characterType) has a named already used. Please choose a new one")
                repeat {
                    character.characterName = UserFunctions.answerWithText()
                    if character.characterName == teamOne[0].characterName || character.characterName == teamOne[1].characterName || character.characterName == teamOne[2].characterName {
                        print("The name you chose is already used by Player 1. Please try again with a new different from \(teamOne[0].characterName!), \(teamOne[1].characterName!), \(teamOne[2].characterName!) ")
                    }
                } while character.characterName == teamOne[0].characterName || character.characterName == teamOne[1].characterName || character.characterName == teamOne[2].characterName
            }
        } 
    }
    
    
    
    
    

    

}
