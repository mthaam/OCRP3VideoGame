//
//  Weapon.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 19/3/21.
//

import Foundation

class Weapon {
    let weaponType: String
    let weaponDamagePower: Int
    let weaponAccuracy: Double
    
    var features: String {"\(weaponType) - Power: \(weaponDamagePower) - Accuracy: \(Int(weaponAccuracy * 100.0))%"}
    
    
    
    
    
    init(newWeaponType: String, newWeaponDamagePower: Int, newWeaponAccuracy: Double = 1.0) {
        self.weaponType = newWeaponType
        self.weaponDamagePower = newWeaponDamagePower
        self.weaponAccuracy = newWeaponAccuracy
        
    }
    
    
    
    static func createWeaponSet() -> [Weapon] {
        let sword = Weapon(newWeaponType: "Sword 🗡", newWeaponDamagePower: 3, newWeaponAccuracy: 0.8)
        let wand = Weapon(newWeaponType: "Wand 🪄", newWeaponDamagePower: 5, newWeaponAccuracy: 0.6)
        let fireStream = Weapon(newWeaponType: "Fire Stream ☄️", newWeaponDamagePower: 4, newWeaponAccuracy: 0.7)
        let paralizer = Weapon(newWeaponType: "Paralizer ⛓", newWeaponDamagePower: 1, newWeaponAccuracy: 1.0)
        let knife = Weapon(newWeaponType: "Knife 🔪", newWeaponDamagePower: 2, newWeaponAccuracy: 0.9)
        
        let weaponSet: [Weapon] = [sword, wand, fireStream, paralizer, knife]
        
        return weaponSet
    }
    
    func generateWeaponDamage() -> Int {
        let randomNumber: Double = Double.random(in: 0.0...1.0)
        var lifePointsToBeLost: Int = 0
        if randomNumber <= weaponAccuracy {
         lifePointsToBeLost = weaponDamagePower
        }
        return lifePointsToBeLost
        
    }

    

    
    // to be completed!
    //    func chestRandomWeapon() -> Weapon {
    //        return

    //    }
    //
    

    
}
