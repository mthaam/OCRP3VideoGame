//
//  Team.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

class Team {
    
    var aliveCharacters: [Character]!
    var deadCharacters: [Character] = []
    
    
    static func chooseCharactersForPlayersTeam() -> Team {
        
        let characterSet: [Character] = Character.displayAvailableCharacters()
        var newCharacterSet: [Character] = []
        let newTeam = Team()
        
        
        var counter: Int = 0
        repeat {
            var userChoice: Int = 0
            
            counter += 1
            print("\nPlease choose character \(counter) and press Enter")
            
            userChoice = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: 6, errorMessage: "Your choice is out of range. Please try again with a choice between 1 and 6")
            
            switch userChoice {
            case 1:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[0], in: newCharacterSet)
            case 2:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[1], in: newCharacterSet)
            case 3:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[2], in: newCharacterSet)
            case 4:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[3], in: newCharacterSet)
            case 5:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[4], in: newCharacterSet)
            case 6:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[5], in: newCharacterSet)
            default:
                break
            }
            
        } while newCharacterSet.count < 3
        
        newTeam.aliveCharacters = newCharacterSet
        
        return newTeam
    }
    
    func teamDisplay() {
        for (index, characterItem) in aliveCharacters.enumerated()  {
            print("\(index + 1) - \(characterItem.characterName!) the \(characterItem.characterType)")
        }
    }
    
    func isThereACharacterToRemoveFromAliveTeam() {
        for (index, character) in aliveCharacters.enumerated() {
            if character.isAlive == false {
                deadCharacters.append(character)
                aliveCharacters.remove(at: index)
            }
        }
    }
    
    func displayTeamStats(of oppositePlayerName: String) {
        guard aliveCharacters.count > 0 else { return }
        print("\nThe remaining characters of \(oppositePlayerName)'s team have the following stats")
        for character in aliveCharacters {
            print("\(character.characterName!) has \(character.lifePoints)  points of life remaining")
        }
    }
    
    func displayFinalTeamStats() {
        if aliveCharacters.count > 0 {
            print("You had \(aliveCharacters.count) who survived :")
            for character in aliveCharacters {
                character.displayCharacterStatsAtEndOfGame()
            }
        } else if aliveCharacters.count > 0 && deadCharacters.count > 0 {
            print("You had \(aliveCharacters.count) who survived :")
            for character in aliveCharacters {
                character.displayCharacterStatsAtEndOfGame()
            }
            print("You also had \(deadCharacters.count) who were killed ☠️ :")
            for character in deadCharacters {
                character.displayCharacterStatsAtEndOfGame()
            }
        } else {
            print("All character in your team were killed ☠️")
            for character in deadCharacters {
                character.displayCharacterStatsAtEndOfGame()
            }
        }
    }

    
}

