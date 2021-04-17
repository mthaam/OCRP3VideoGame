//
//  Character.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//
// swiftlint:disable all

import Foundation
/// This Class defines properties of a character, such as name, type, life points.
/// It also has static functions that are used to create character objects in other classes.
/// It also has functions that modifies object properties.
/// - Note that property Weapon is an implicitly unwrapped optional on purpose,
/// because this property is never called being nil.
class Character {

    var characterName: String
    var characterType: String

    private var _lifePoints: Int = 10
    var lifePoints: Int { get {_lifePoints}
        set {_lifePoints = max(0, newValue)}
    }

    var isAlive: Bool { lifePoints > 0 }
    var weaponOfCharacter: Weapon!

    private var _nbrOfHitReceived = 0
    var nbrOfHitReceived: Int { get { _nbrOfHitReceived }
        set { _nbrOfHitReceived = newValue} }

    private var _nbrOfSuccessfullHits: Int = 0
    var nbrOfSuccessfullHits: Int { get { _nbrOfSuccessfullHits }
        set { _nbrOfSuccessfullHits = newValue} }

    var percentageOfSuccessfullHitsReceived: Int { (nbrOfSuccessfullHits * 100)/nbrOfHitReceived }

    private var _givenHits: Int = 0
    var givenHits: Int { get { _givenHits}
        set { _givenHits = newValue} }

    init(newCharacterName: String, newCharacterType: String) {
        self.characterName = newCharacterName
        self.characterType = newCharacterType
    }

    /// This function returns an array of Character objects.
    /// - When called, this function displays to a player the available characters in the returned array.
    static func displayAvailableCharacters() -> [Character] {

        let warrior = Character(newCharacterName: "", newCharacterType: "Warrior 🥷")
        let knight = Character(newCharacterName: "", newCharacterType: "Knight 🦄")
        let wizard = Character(newCharacterName: "", newCharacterType: "Wizard 🧙‍♂️")
        let fairy = Character(newCharacterName: "", newCharacterType: "Fairy 🧝‍♀️")
        let demon = Character(newCharacterName: "", newCharacterType: "Deamon 😈")
        let elf = Character(newCharacterName: "", newCharacterType: "Elf 🧚‍♀️")

        let characterArray: [Character] = [warrior, knight, wizard, fairy, demon, elf]

        var counter = 0
        for character in characterArray {
            counter += 1
            print("\nEnter \(counter) for \(character.characterType)")
        }

        return characterArray
    }

    /// This function returns a character, previously chosen in the returned array of displayAvailableCharacters.
    ///  It is used to choose a character and choose a name for selected Character.
    /// - Parameter ofCharacters : receives a specific Character.
    /// - Parameter arrayToAppend : receives an array to append, used in class Team.
    /// - chooseNameForCharacter() is applied to selected character before being appened to the returned array.
    static func addCharacterAndName(withChoice ofCharacters: Character, in arrayToAppend: [Character]) -> [Character] {
        let selectedCharacter: Character = ofCharacters
        var newArrayForPlayer: [Character] = arrayToAppend

        selectedCharacter.chooseNameForCharacter()

        UserFunctions.usedCharacterNames.append(selectedCharacter.characterName)

        newArrayForPlayer.append(selectedCharacter)

        return newArrayForPlayer

    }

    /// This function modifies the name of a Character, and controls that
    /// the chosen name has not been previously used for amother character.
    /// - To do so, the name in String type is appended to a static array in class UserFunctions.
    /// Note that the chosen name is appended twice, to prevent control fail if name is typed by
    /// user capitalized or uncapitalized.
    func chooseNameForCharacter() {
        var newCharacterName: String = ""

        print("\nNow choose a name for character \(characterType)")

        repeat {
            newCharacterName = UserFunctions.answerWithText()
            if newCharacterName.count < 3 {
                print("\n❌ The name you chose is too short, please choose a name with at least 3 letters")
            }

            if UserFunctions.usedCharacterNames.contains(newCharacterName) || UserFunctions.usedCharacterNames.contains(newCharacterName.capitalized) {
                print("\n❌ This name is already used by another character. Please choose another one.")
            }

        } while newCharacterName.count < 3 || UserFunctions.usedCharacterNames.contains(newCharacterName) || UserFunctions.usedCharacterNames.contains(newCharacterName.capitalized)
        characterName = newCharacterName
        UserFunctions.usedCharacterNames.append(newCharacterName)
        UserFunctions.usedCharacterNames.append(newCharacterName.capitalized)

    }

    /// This function uses a switch statement to change weapon var of a character.
    /// - Parameter choice : an Int value which is an index in an array of Weapons.
    /// - Parameter weaponSet : an array of Weapons in which the desired weapon is chosen.
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

    /// This function removes life points to a character.
    /// - Parameter playername : a  String value used in a print in case of sucessfull hit.
    /// - Parameter character : Receives a character, who performs the attack.
    /// - First life points to be removed are generated with weaponOfCharacter.generateWeaponDamage()
    /// - If points generated are > or = to weapon's damage power, the hit is successfull
    /// and points can be removed.
    /// - Else the hit is unsuccessfull.
    func receiveHit(by playerName: String, from character: Character) {
        let lifePointsToRemove = character.weaponOfCharacter.generateWeaponDamage()
        nbrOfHitReceived += 1
        if lifePointsToRemove >= character.weaponOfCharacter.weaponDamagePower {
            lifePoints -= min(lifePointsToRemove, lifePoints)
            nbrOfSuccessfullHits += 1

            if _lifePoints > 0 {
                print("\n\(self.characterName.capitalized) the \(self.characterType) now has \(lifePoints) points of life")
            } else {
                print("\n👏 Good job \(playerName)! 👍 You just killed \(self.characterName.capitalized) the \(self.characterType)! ☠️")
            }
        } else {
            print("You missed the target. Maybe next time! 🙀")
        }
    }

    /// This function reads character stats a the end of Game.
    /// - Note that guard statement is used here to avoid a division by 0 error.
    func readCharacterStatsAtEndOfGame() {
        guard nbrOfHitReceived > 0 else {
            print("\(characterName) was never hit")
            return
        }
        print("\n\(characterName) the \(characterType) was hit \(nbrOfHitReceived) times. \(nbrOfSuccessfullHits) hits were successfull.")
        print("That's a \(percentageOfSuccessfullHitsReceived)% success rate")
        print("He/She also gave \(givenHits) hits to his fellow ennemies.")
    }

    /// This functions increments var givenHits, later red in final stats.
    func incrementGivenHits() {
        givenHits += 1
    }

    /// This function generates a random weapon, and changes weapon of Character.
    /// - The randomly generated weapon is created by Weapon.chestRandomWeaponGenerator()
    func changeWeaponWithMagicChestWeapon() {
        let randomlyGeneratedWeapon: Weapon = Weapon.chestRandomWeaponGenerator()
        if randomlyGeneratedWeapon.weaponDamagePower < weaponOfCharacter.weaponDamagePower {
            print("\nBad luck! 🥀 The chest contains a less powerful weapon!")
        } else {
            print("\nThis is your lucky day! 🍀 The chest contains a more powerful weapon!")
        }
        weaponOfCharacter = randomlyGeneratedWeapon
    }

}
