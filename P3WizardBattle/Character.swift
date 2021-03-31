//
//  Character.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

class Character {
    
    var characterName: String
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
    
    

    
    
    
}
