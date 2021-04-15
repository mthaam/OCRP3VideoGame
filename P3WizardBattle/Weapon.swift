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
        let sword = Weapon(newWeaponType: "Sword 🗡", newWeaponDamagePower: 3, newWeaponAccuracy: 0.72)
        let wand = Weapon(newWeaponType: "Wand 🪄", newWeaponDamagePower: 5, newWeaponAccuracy: 0.5)
        let fireStream = Weapon(newWeaponType: "Fire Stream ☄️", newWeaponDamagePower: 4, newWeaponAccuracy: 0.61)
        let paralizer = Weapon(newWeaponType: "Paralizer ⛓", newWeaponDamagePower: 1, newWeaponAccuracy: 0.96)
        let knife = Weapon(newWeaponType: "Knife 🔪", newWeaponDamagePower: 2, newWeaponAccuracy: 0.84)
        
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
    
    static func chestRandomWeaponGenerator() -> Weapon {
        let poison = Weapon(newWeaponType: "Deadly Poison 🧪", newWeaponDamagePower: 10, newWeaponAccuracy: 1.0)
        let zombieVirus = Weapon(newWeaponType: "Zombie Virus 🦠", newWeaponDamagePower: 7, newWeaponAccuracy: 1.0)
        let snailTransform = Weapon(newWeaponType: "Snail Transformer 🐌", newWeaponDamagePower: 8, newWeaponAccuracy: 1.0)
        let sunBurn = Weapon(newWeaponType: "Sun Burner ☀️", newWeaponDamagePower: 1, newWeaponAccuracy: 1.0)
        let freeze = Weapon(newWeaponType: "Freezerizer ❄️", newWeaponDamagePower: 2, newWeaponAccuracy: 1.0)
        let fistPunch = Weapon(newWeaponType: "Fist Punch 🤛", newWeaponDamagePower: 1, newWeaponAccuracy: 1.0)
        
        let magicWeaponSet: [Weapon] = [poison, zombieVirus, snailTransform, sunBurn, freeze, fistPunch]
        let randomIndexGenerator: Int = Int.random(in: 0...5)
        
        return magicWeaponSet[randomIndexGenerator]
    }

}
