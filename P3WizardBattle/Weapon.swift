//
//  Weapon.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 19/3/21.
//

import Foundation

class Weapon {
    var weaponType: String
    var weaponDamagePower: Int
    
    
    init(newWeaponType: String, newWeaponDamagePower: Int) {
        self.weaponType = newWeaponType
        self.weaponDamagePower = newWeaponDamagePower
    }
    
    
    
    static func createWeaponSet() -> [Weapon] {
        let sword = Weapon(newWeaponType: "Sword 🗡", newWeaponDamagePower: 3)
        let wand = Weapon(newWeaponType: "Wand 🪄", newWeaponDamagePower: 5)
        let fireStream = Weapon(newWeaponType: "Fire Stream ☄️", newWeaponDamagePower: 4)
        let paralizer = Weapon(newWeaponType: "Paralizer ⛓", newWeaponDamagePower: 1)
        let knife = Weapon(newWeaponType: "Knife 🔪", newWeaponDamagePower: 2 )
        
        let weaponSet: [Weapon] = [sword, wand, fireStream, paralizer, knife]
        
        return weaponSet
    }

    
    static func displayWeaponSet() {
    
    }
    
    // to be completed!
    //    func chestRandomWeapon() -> Weapon {
    //        return

    //    }
    //
    

    
}
