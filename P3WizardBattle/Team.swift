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
                newCharacterSet = addCharacterAndName(withChoice: characterSet[0], in: newCharacterSet)
            case 2:
                newCharacterSet = addCharacterAndName(withChoice: characterSet[1], in: newCharacterSet)
            case 3:
                newCharacterSet = addCharacterAndName(withChoice: characterSet[2], in: newCharacterSet)
            case 4:
                newCharacterSet = addCharacterAndName(withChoice: characterSet[3], in: newCharacterSet)
            case 5:
                newCharacterSet = addCharacterAndName(withChoice: characterSet[4], in: newCharacterSet)
            case 6:
                newCharacterSet = addCharacterAndName(withChoice: characterSet[5], in: newCharacterSet)
            default:
                break
            }
            
        } while newCharacterSet.count < 3
        
        newCharacterSet = checkIfCharactersNamesAreIdentical(in: newCharacterSet)
        
//        if playersCharacters.first?.characterName == playersCharacters.last?.characterName {
//            print("\(playersCharacters.first!.characterType) and \(playersCharacters.last!.characterType) still have identical names. Please try with a different name for \(playersCharacters.last!.characterType) ")
//            repeat {
//                playersCharacters.last?.characterName = UserFunctions.answerWithText()
//            } while playersCharacters.first?.characterName == playersCharacters.last?.characterName
//        }
        
        return newCharacterSet
    }
    
    
    
    private static func addCharacterAndName(withChoice ofCharacters: Character, in arrayToAppend : [Character]) -> [Character] {
        let _selectedCharacter: Character = ofCharacters
        var newArrayForPlayer: [Character] = arrayToAppend
        
        _selectedCharacter.characterName = chooseNameForCharacter(with: _selectedCharacter)
        
        newArrayForPlayer.append(_selectedCharacter)
        if newArrayForPlayer.count > 1 {
            newArrayForPlayer = checkIfCharactersNamesAreIdentical(in: newArrayForPlayer)
        }
        
        
        return newArrayForPlayer
        
    }
    
    private static func chooseNameForCharacter(with character: Character) -> String {
        var newCharacterName: String = character.characterName
        
        print("\nNow choose a name for character \(character.characterType)")
        
        repeat {
            newCharacterName = UserFunctions.answerWithText()
            if newCharacterName.count < 3 {
                print("\nThe name you chose is too short, please choose a name with at least 3 letters")
            }
        } while newCharacterName.count < 3
        
        return  newCharacterName
    }
    
    private static func checkIfCharactersNamesAreIdentical(in array: [Character]) -> [Character] {
        let playersCharacters = array
        
        var index = 0
        for character in playersCharacters {
            
            index += 1
            
            if index < playersCharacters.count {
                if character.characterName == playersCharacters[index].characterName  { // || character.characterName == playersCharacters.last?.characterName || character.characterName == playersCharacters.first?.characterName
                    print("\nThe characters \(character.characterType) and \(playersCharacters[index].characterType) have identical names. Please choose another one for character \(playersCharacters[index].characterType).")
                    repeat{
                        playersCharacters[index].characterName = UserFunctions.answerWithText()
                        if character.characterName == playersCharacters[index].characterName {
                            print("Characters still have identical names. Please try with a different name")
                        }
                    } while character.characterName == playersCharacters[index].characterName
                }
            }
        }

//        if playersCharacters.first?.characterName == playersCharacters.last?.characterName {
//            print("\(playersCharacters.first!.characterType) and \(playersCharacters.last!.characterType) still have identical names. Please try with a different name for \(playersCharacters.last!.characterType) ")
//            repeat {
//                playersCharacters.last?.characterName = UserFunctions.answerWithText()
//            } while playersCharacters.first?.characterName == playersCharacters.last?.characterName
//        }
        
        return playersCharacters

    }
}

