//
//  Weapon.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 19/3/21.
//
// swiftlint:disable all

import Foundation

/// This class manages weapons a Character can use to attack.
/// - A weapon has 3 features ;
/// - weaponType is the name of the weapon
/// - weaponDamagePower is an Int value used to remove points of life to the hit Character.
/// - weaponAccuracy is a Double value, representing a percentage of accuracy of a weapon.
/// The higher the value, the greater chances to hit successfully a Character.
final class Weapon {
    let weaponType: String
    let weaponDamagePower: Int
    let weaponAccuracy: Double
    var features: String {"\(weaponType) - Power: \(weaponDamagePower) - Accuracy: \(Int(weaponAccuracy * 100.0))%"}

    init(newWeaponType: String, newWeaponDamagePower: Int, newWeaponAccuracy: Double = 1.0) {
        self.weaponType = newWeaponType
        self.weaponDamagePower = newWeaponDamagePower
        self.weaponAccuracy = newWeaponAccuracy
    }

    /// This function returns an array of Weapons.
    /// - It is used for a player to choose a weapon in the returned array for a Character.
    static func createWeaponSet() -> [Weapon] {
        let sword = Weapon(newWeaponType: "Sword 🗡", newWeaponDamagePower: 3, newWeaponAccuracy: 0.72)
        let wand = Weapon(newWeaponType: "Wand 🪄", newWeaponDamagePower: 5, newWeaponAccuracy: 0.5)
        let fireStream = Weapon(newWeaponType: "Fire Stream ☄️", newWeaponDamagePower: 4, newWeaponAccuracy: 0.61)
        let paralizer = Weapon(newWeaponType: "Paralizer ⛓", newWeaponDamagePower: 1, newWeaponAccuracy: 0.96)
        let knife = Weapon(newWeaponType: "Knife 🔪", newWeaponDamagePower: 2, newWeaponAccuracy: 0.84)

        let weaponSet: [Weapon] = [sword, wand, fireStream, paralizer, knife]

        return weaponSet
    }

    /// This function returns an Int value, which represents the points a hit Character will loose.
    /// - A double value is randomly generated.
    /// - If the random Double value is less or equal to Weapon accuracy, var lifePointsToBeLost
    /// takes the value of weaponDamagePower, and the returned value can be used to remove life points
    /// to the attacked Character.
    /// - Otherwise, the returned value is 0 and no life points will be lost for hit Character.
    func generateWeaponDamage() -> Int {
        let randomNumber: Double = Double.random(in: 0.0...1.0)
        var lifePointsToBeLost: Int = 0
        if randomNumber <= weaponAccuracy {
         lifePointsToBeLost = weaponDamagePower
        }
        return lifePointsToBeLost
    }

    /// This function returns a random Weapon.
    /// - Every weapon item generated is appended to the array magicWeaponSet.
    /// - A random Int value is generated in range 0...5 (5 being the array's last index.)
    /// - The returned weapon is determined by the random index previously generated.
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
