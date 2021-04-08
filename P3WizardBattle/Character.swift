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
    
    private var _lifePoints: Int = 10
    var lifePoints: Int { get {_lifePoints}
        set {_lifePoints = max(0, newValue)}
    }
    
    var isAlive: Bool { lifePoints > 0 }
    var weaponOfCharacter: Weapon
    
    private var _nbrOfHitReceived = 0
    var nbrOfHitReceived: Int { get { _nbrOfHitReceived }
        set { _nbrOfHitReceived = newValue} }
    
    private var _nbrOfSuccessfullHits: Int = 0
    var nbrOfSuccessfullHits: Int { get { _nbrOfSuccessfullHits }
        set { _nbrOfSuccessfullHits = newValue} }
    
    var percentageOfSuccessfullHits: Int { (nbrOfSuccessfullHits * 100)/nbrOfHitReceived }
    
    
    
    
    
    
    init(newCharacterName: String, newWeaponOfCharacter: Weapon, newCharacterType: String) {
        self.characterName = newCharacterName
        self.characterType = newCharacterType
        self.weaponOfCharacter = newWeaponOfCharacter
    }
    
    static func displayAvailableCharacters() -> [Character] {
        let blankWeapon = Weapon(newWeaponType: "blank", newWeaponDamagePower: 0)
        
        let warrior = Character(newCharacterName: "", newWeaponOfCharacter: blankWeapon, newCharacterType: "Warrior 🥷")
        let knight = Character(newCharacterName: "", newWeaponOfCharacter: blankWeapon, newCharacterType: "Knight 🦄")
        let wizard = Character(newCharacterName: "", newWeaponOfCharacter: blankWeapon, newCharacterType: "Wizard 🧙‍♂️")
        let fairy = Character(newCharacterName: "", newWeaponOfCharacter: blankWeapon, newCharacterType: "Fairy 🧝‍♀️")
        let demon = Character(newCharacterName: "", newWeaponOfCharacter: blankWeapon, newCharacterType: "Deamon 😈")
        let elf = Character(newCharacterName: "", newWeaponOfCharacter: blankWeapon, newCharacterType: "Elf 🧚‍♀️")
        
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
    
    
    func changeWeapon(with choice: Int, in weaponSet: [Weapon]) {
        switch choice {
        case 1:
            weaponOfCharacter = weaponSet[choice - 1]
        case 2:
            weaponOfCharacter = weaponSet[choice - 1]
        case 3:
            weaponOfCharacter = weaponSet[choice - 1]
        case 4:
            weaponOfCharacter = weaponSet[choice - 1]
        case 5:
            weaponOfCharacter = weaponSet[choice - 1]
        default:
            break
        }

    }
    
    func receiveHit(by playerName: String, from character: Character) {
        lifePoints -= min(character.weaponOfCharacter.weaponDamagePower, lifePoints)
        nbrOfHitReceived += 1
        
        if _lifePoints > 0 {
            print("\n\(self.characterName!.capitalized) the \(self.characterType) now has \(lifePoints) points of life")
        } else {
            print("\n👏 Good job \(playerName)! 👍 You just killed \(self.characterName!.capitalized) the \(self.characterType)!")
        }
        
        
    }
    
    
    func displayCharacterStatsAtEndOfGame() {
        print("\n\(characterName!) was hit \(nbrOfHitReceived). \(nbrOfSuccessfullHits) were successfull.")
        print("That's a \(percentageOfSuccessfullHits)% success rate")
    }
    
    
    
    
    
}
