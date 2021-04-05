//
//  Team.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

class Team {
    
    var team: [Character]!
        
    
    static func chooseCharactersForPlayersTeam() -> Team {
        
        let characterSet: [Character] = Character.displayAvailableCharacters()
        var newCharacterSet: [Character] = []
        let newTeam = Team()
        
        
        var counter: Int = 0
        repeat {
            var userChoice: Int = 0
            
            counter += 1
            print("\nPlease choose character \(counter) and press Enter")
            
            repeat {
                userChoice = UserFunctions.setChoice()
                if userChoice < 1 || userChoice > 6 {
                    print("Your choice is out of range. Please try again with a choice between 1 and 6")
                }
            } while userChoice < 1 || userChoice > 6
            
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
        
        newTeam.team = newCharacterSet
        
        return newTeam
    }
    
    func teamDisplay() {
        var counter = 0
        for characterItem in team {
            counter += 1
            print("\(characterItem.characterName!) the \(characterItem.characterType)")
        }
    }

}

