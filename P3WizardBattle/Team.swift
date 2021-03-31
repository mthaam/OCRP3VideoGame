//
//  Team.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

class Team {
    
    var team = [Character]()

    init(newTeam: [Character]) {
        self.team = newTeam
    }
    
    
    static func chooseCharactersForPlayersTeam(in availCharacters: [Character]) -> [Character] {
        
        let characterSet = availCharacters
        var newCharacterSet: [Character] = []
        
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
        
        newCharacterSet = chooseNamesForCharacters(withPlayersTeam: newCharacterSet)
        
        return newCharacterSet
    }
    

    private static func chooseNamesForCharacters(withPlayersTeam array: [Character]) -> [Character] {
        let playersCharacters = array
        var newCharacterName: String = ""
        
        print("\nPlease choose names for each of your characters")
        
        

        for character in playersCharacters {
            print("Now choose a name for character \(character.characterType)")
            repeat {
                newCharacterName = UserFunctions.answerWithText()
            } while newCharacterName.count < 3
            character.characterName = newCharacterName
        }
        return playersCharacters
    }

    
    private static func checkIfCharactersNamesAreIdentical(in array: [Character]) -> [Character] {
        let playersCharacters = array
        var newCharacterName: String = ""
        var index = 0
        
//        if playersCharacters.elementsEqual(<#T##other: Sequence##Sequence#>, by: { (<#Character#>, <#Sequence.Element#>) -> Bool in
//            <#code#>
//        })

        for character in playersCharacters {
            index += 1
            if character.characterName == playersCharacters[index].characterName {
                print("Another character has this name. Please choose another one.")
            }
        }
        return playersCharacters
    }
    



    
    
    
}

