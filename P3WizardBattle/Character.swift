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
    
    
    static func createCharacterSet() -> [Character] {
        let blankWeapon = Weapon(newWeaponType: "blank", newWeaponDamagePower: 0)
        
        let warrior = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Guerrier")
        let knight = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Chevalier")
        let wizard = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Magicien")
        let fairy = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Fée")
        let demon = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Démon")
        let elf = Character(newCharacterName: "", newLifePoints: 100, newIsDead: false, newWeaponOfCharacter: blankWeapon, newCharacterType: "Elfe")
        return [warrior, knight, wizard, fairy, demon, elf]
    }

    
    
    
}
