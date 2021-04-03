//
//  Character.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

class Character {
    
    var characterName: String!
    var characterType: String
    
    var lifePoints: Int
    var isDead: Bool
    var weaponOfCharacter: Weapon
    
    
    init(newCharacterName: String, newLifePoints: Int, newIsDead: Bool, newWeaponOfCharacter: Weapon, newCharacterType: String) {
        self.characterName = newCharacterName
        self.characterType = newCharacterType
        self.lifePoints = newLifePoints
        self.isDead = newIsDead
        self.weaponOfCharacter = newWeaponOfCharacter
    }
    
    static func displayAvailableCharacters() -> [Character] {
        let blankWeapon = Weapon(newWeaponType: "blank", newWeaponDamagePower: 0)
        
        let warrior = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Warrior")
        let knight = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Knight")
        let wizard = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Wizard")
        let fairy = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Fairy")
        let demon = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Deamon")
        let elf = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Elf")
        
        let characterArray: [Character] = [warrior, knight, wizard, fairy, demon, elf]
        
        var counter = 0
        for character in characterArray {
            counter += 1
            print("\nEnter \(counter) for \(character.characterType)")
        }
        
        return characterArray
    }
    
    static func addCharacterAndName(withChoice ofCharacters: Character, in arrayToAppend : [Character]) -> [Character] {
        var _selectedCharacter: Character = ofCharacters
        var newArrayForPlayer: [Character] = arrayToAppend
        
        _selectedCharacter.characterName = chooseNameForCharacter(with: _selectedCharacter)
        _selectedCharacter = checkIfNewCharacterNameIsAlreadyUsed(forCharacter: _selectedCharacter, comparedTo: newArrayForPlayer)
        
        newArrayForPlayer.append(_selectedCharacter)
        
        return newArrayForPlayer
        
    }
    
    
    private static func checkIfNewCharacterNameIsAlreadyUsed(forCharacter: Character, comparedTo: [Character]) -> Character {
        let newCharacter = forCharacter
        let existingCharacters = comparedTo
        
        repeat {
            for character in existingCharacters {
                if newCharacter.characterName == character.characterName {
                    repeat {
                        print("The name you chose for \(newCharacter.characterType) is already used. Please choose a new name for your character")
                        newCharacter.characterName = UserFunctions.answerWithText()
                    } while newCharacter.characterName == character.characterName
                }
            }
        } while newCharacter.characterName == existingCharacters.first?.characterName
        
        
        return newCharacter
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
    
    //    static func checkIfPlayer1HasATeam(in array: [Character]) -> [Character]? {
    //        guard array.count > 3 else { return nil }
    //        var teamCopy: [Character] = []
    //
    //        for character in array {
    //            teamCopy.append(character)
    //        }
    //        return teamCopy
    //    }
    
    
    
    
    
    
}
