//
//  Team.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

class Team {
    var player: Player
    
    var team = [Character]()
    
    

    init(newTeam: [Character], newPlayer: Player) {
        self.team = newTeam
        self.player = newPlayer
    }
    
    static func displayCharacterSet(ofCharacters: [Character]) {
        let characterSet: [Character] = ofCharacters
        print("Veuillez choisir 3 personnages parmis les suivants")
        
        for character in characterSet {
            print("Nom: \(character.characterType) ")
        }
        
    }
    
    
    static func chooseTeam(forPlayer player: Player, withCharacters character: [Character]) -> Team {
        
        let player = player
        let characterSet = character
        var newCharacterSet: [Character] = []
        
        var userChoice: Int?
        
        var counter: Int = 0
        for charLoop in characterSet {
            counter += 1
            print("Entrez \(counter) pour \(charLoop.characterType)")
        }
        
        repeat {
            repeat {
                userChoice = UserFunctions.setChoice()
            } while userChoice == nil // && userChoice < 1 
            
            switch userChoice! {
            case 1:
                newCharacterSet = chooseCharacterForTeam(with: 6, with: characterSet)
            case 2:
                newCharacterSet = chooseCharacterForTeam(with: 6, with: characterSet)
            case 3:
                newCharacterSet = chooseCharacterForTeam(with: 6, with: characterSet)
            case 4:
                newCharacterSet = chooseCharacterForTeam(with: 6, with: characterSet)
            case 5:
                newCharacterSet = chooseCharacterForTeam(with: 6, with: characterSet)
            case 6:
                newCharacterSet = chooseCharacterForTeam(with: 6, with: characterSet)
            default:
                break
            }
            
        } while newCharacterSet.count < 3
        
        let team = Team(newTeam: newCharacterSet, newPlayer: player)
        
        return team
    }
    
//    static func chooseNamesForTeamsCharacters(withPlayersTeam team: Team) -> Team {
//        let playersTeam = team
//        var characterName: String?
//
//        repeat {
//
//        } while
//
//
//    }
    
    static private func chooseCharacterForTeam(with userChoice: Int!, with characterSet: [Character]) -> [Character] {
        let userChoice = userChoice
        let characterSet = characterSet
        var newCharacterSet: [Character] = []
        
        if userChoice == 1 {
            newCharacterSet.append(characterSet[0])
        } else if userChoice == 2 {
            newCharacterSet.append(characterSet[1])
        } else if userChoice == 3 {
            newCharacterSet.append(characterSet[2])
        } else if userChoice == 4 {
            newCharacterSet.append(characterSet[3])
        } else if userChoice == 5 {
            newCharacterSet.append(characterSet[4])
        } else if userChoice == 6 {
            newCharacterSet.append(characterSet[5])
        }
        return newCharacterSet
    }
    


    
    
    
}
