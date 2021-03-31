//
//  Team.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

class Team {
//    var player: Player
    
    var team = [Character]()
    
    

    init(newTeam: [Character]) {
        self.team = newTeam
//        self.player = newPlayer
    }
    
    static func displayCharacterSet(ofCharacters: [Character]) {
        let characterSet: [Character] = ofCharacters
        print("Veuillez choisir 3 personnages parmis les suivants")
        
        for character in characterSet {
            print("Nom: \(character.characterType) ")
        }
        
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
    
    static func chooseCharactersForPlayersTeam(in availCharacters: [Character]) -> [Character] {
        
        let characterSet = availCharacters
        var newCharacterSet: [Character] = []
        
        
        
        
        var counter: Int = 0
        repeat {
            var userChoice: Int = 0
            
            counter += 1
            print("\nPlease choose character \(counter)")

            repeat {
                userChoice = UserFunctions.setChoice()
                if userChoice < 1 || userChoice > 6 {
                    print("Your choice is out of range. Please try again with a choice between 1 and 6")
                }
            } while userChoice < 1 || userChoice > 6

            switch userChoice {
            case 1:
                newCharacterSet.append(characterSet[0])
            case 2:
                newCharacterSet.append(characterSet[1])
            case 3:
                newCharacterSet.append(characterSet[2])
            case 4:
                newCharacterSet.append(characterSet[3])
            case 5:
                newCharacterSet.append(characterSet[4])
            case 6:
                newCharacterSet.append(characterSet[5])
            default:
                break
            }

        } while newCharacterSet.count < 3
        
        return newCharacterSet
    }
// REFACTOR WITH;
//    func appendCharacterSet(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
    
// FIND A WAY TO ADD A MESSAGE SAYING PLAYER XXX HERE ARE THE CHARACTERS YOU CHOSE
    
     static func askChoice() -> String {
        print("Bienvenue dans Note Manager"
                + "\n1. Tapez 1 saisir une note"
                + "\n2. Tapez 2 calculer une moyenne"
                + "\n3. Tapez 3 quitter le programme"
        )
        print("Que souhaitez vous faire?")
        var choiceValue: String?
        repeat {
            choiceValue = readLine()
            
            if choiceValue == nil {
                print("Une choix doit etre effectue")
            }
        } while choiceValue == nil
        return choiceValue!
    }

    


    
    
    
}

