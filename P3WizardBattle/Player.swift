//
//  Player.swift
//  P3WizardBattle
//
//  Created by SEBASTIEN BRUNET on 23/03/2021.
//
// swiftlint:disable all

import Foundation

/// class Player represents a user with 2 key properties : playerName and team
/// - Other properties isItPlayersTurn, atLeastOneCharacterInTeamIsAlive are used in class fight.
/// - private let immutableChestLockKey is only used in attack()
final class Player {
    var playerName: String
    var team: Team = Team()
    var isItPlayersTurn: Bool = false
    var atLeastOneCharacterInTeamIsAlive: Bool { team.aliveCharacters.count > 0 }
    private let immutableChestLockKey: Int = 5

    init(newPlayerName: String) {
        self.playerName = newPlayerName
    }

    /// This static function returns an array of 2 players
    /// - function askNameForPlayer from UserFunctions class is called straight when creating a new Player object in the array.
    static func createPlayersArray() -> [Player] {
        var playersArray: [Player] = []
        repeat {
            for count in 1...2 {
                print("Now enter name for player \(count) and press Enter âŠī¸")
                playersArray.append(Player(newPlayerName: UserFunctions.askNameForPlayer()))
            }

        } while playersArray.count < 2

        return playersArray
    }

    /// Calls chooseCharactersForPlayersTeam() from class Team.
    /// - chooseCharactersForPlayersTeam()  returns a Team, which is an array of 3 characters.
    func chooseTeam() {
        print("\n\nPlease choose characters for player \(playerName.capitalized)")
        team = Team.chooseCharactersForPlayersTeam()
        print("\nCongratulations \(playerName.capitalized), your team is all set! đ")
        print(
            """
            =========================================================================

            """)
    }

    /// Reviews what character and its name in player's team.
    /// - All characters being stored in an array named aliveCharacters when creating a team,
    /// this array is looped over.
    func teamReview() {
        print("\n\(playerName.capitalized), Your team now has the following characters")
        for character in team.aliveCharacters {
            print(" \(character.characterName) the \(character.characterType)")
        }
    }

    /// attack() permits to a player to choose a player in his own team and attack another one in opponent's team.
    ///  - Parameter opposingTeam: receives a type Team value, in which later a character will be chosen to be attacked.
    ///
    /// - teamDisplay is called to show player what characters are available in his team to attack with.
    /// - Each time a player attacks, a key is randomly generated to open a chest.
    /// - A character is chosen to perform the attack.
    /// - The chosen character is equiped with a weapon if he doesn't have one,
    /// or it can also randomly access to the chest if randomly generated key matches chest lock and choose to use it or not,
    /// or it can also choose to change weapon or not.
    /// - Then player attacking chooses a character of opponent's team to attack.
    /// - The actual attack is performed after readline() , when function receiveHit() is called on the attacked character.
    /// - isThereACharacterToRemoveFromAliveTeam() is called to remove any character from opponent's aliveTeam.
    /// - isItPlayersTurn is toggled.
    func attack(againstTeam opposingTeam: Team ) {
        let randomlyGeneratedChestOpeningKey: Int = Int.random(in: 1...8)
        print("\n\(playerName), choose a character of your Team to attack with.")
        self.team.teamDisplay()
        let characterChoice: Int = chooseAttackingCharacter()
        if self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter == nil {
            print("\nđĢ đĒ đĒ Now it's time to choose a weapon for this character. Please select a weapon in the list below:")
            displayWeaponSetAndChooseAWeapon(withSelected: characterChoice)
        } else {
            if immutableChestLockKey == randomlyGeneratedChestOpeningKey {
                presentChest(with: characterChoice)
            } else {
                if let weapon = self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter { useANewWeaponOrNot(with: characterChoice, currentWeapon: weapon) }
            }
        }
        print("\nNow choose a character to attack")
        print("Choose from the characters of the other player:")
        opposingTeam.teamDisplay()
        let choiceOfCharacterToAttack = chooseAttackedCharacter(in: opposingTeam)
        displayAttackSumUp(with: characterChoice, against: choiceOfCharacterToAttack, opposingTeam: opposingTeam)
        opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].receiveHit(by: playerName, from: team.aliveCharacters[characterChoice - 1])
        team.aliveCharacters[characterChoice - 1].incrementGivenHits()
        if let savedWeapon = self.team.aliveCharacters[characterChoice - 1].temporaryWeaponSaver { rearmCharacterWithPreviousWeapon(with: characterChoice, savedWeapon: savedWeapon) }
        opposingTeam.isThereACharacterToRemoveFromAliveTeam()
        isItPlayersTurn.toggle()
    }

    /// This function returns an Int value and comes as support to attack() function
    /// The returned value represents an index used in an array.
    private func chooseAttackedCharacter(in opposingTeam: Team) -> Int {
        let choiceOfCharacterToAttack = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: opposingTeam.aliveCharacters.count, errorMessage:
                                                                    """
        â The opposing team has just \(opposingTeam.aliveCharacters.count) characters!\
        Try again with a number between 1 and \(opposingTeam.aliveCharacters.count).
        """)
        return choiceOfCharacterToAttack
    }

    /// This function returns an Int value and comes as support to attack() function
    /// The returned value represents an index used in an array.
    private func chooseAttackingCharacter() -> Int {
        let characterChoice: Int = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: self.team.aliveCharacters.count, errorMessage:
        """
        â Your team has just \(team.aliveCharacters.count) characters! Try again with a number between 1 and \(team.aliveCharacters.count).
        """)
        return characterChoice
    }

    /// This function comes as support to attack() function
    /// - Parameter characterChoice : an Int value representing an index in an array.
    /// - Parameter savedWeapon: a weapon object used to change weapon of attacking character in case the chest appears.
    private func rearmCharacterWithPreviousWeapon(with characterChoice: Int, savedWeapon: Weapon) {
        print(
            """
            \nâ ī¸ Just so you know \(playerName.capitalized), your character got back the weapon he had before opening the chest.\
            Next time you attack with him, he will use \(savedWeapon.features) unless you choose another weapon.
            """)
        self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter = savedWeapon
        self.team.aliveCharacters[characterChoice - 1].temporaryWeaponSaver = nil
    }

    /// This function comes as support to attack() function
    /// - Parameter characterChoice : an Int value representing an index in an array.
    /// - Parameter choiceOfCharacterToAttack: an Int value representing an index in an array.
    /// - Parameter opposingTeam: a team object used to display attacked character name and type.
    private func displayAttackSumUp(with characterChoice: Int, against choiceOfCharacterToAttack: Int, opposingTeam: Team) {
        if let weapon = self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter {
            print(
                """
            \n\(playerName.capitalized), you are now ready to attack with \(self.team.aliveCharacters[characterChoice - 1].characterName.capitalized) \
            the \(self.team.aliveCharacters[characterChoice - 1].characterType) and his weapon \(weapon.weaponType), \
            press enter to hit \(opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].characterName.capitalized) the \
            \(opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].characterType)
            """)
        }
        _ = readLine()
    }

    /// This function comes as support to attack() function
    /// - Parameter characterChoice : an Int value representing an index in an array.
    /// - Parameter currentWeapon: a weapon object used to change weapon of attacking character .
    private func useANewWeaponOrNot(with characterChoice: Int, currentWeapon: Weapon) {
        print(
            """
            \nYour selected character \(self.team.aliveCharacters[characterChoice - 1].characterName) \
            has the weapon \(currentWeapon.features)
            """)
        print("Would you like to keep or change this weapon?")
        print("Enter 1 to keep - Enter 2 to change")
        let keepOrChangeWeapon = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: 2, errorMessage:
                                                            """
        â You can only choose 1 to keep your character's current weapon, or 2 to keep it. Please try again.
        """)
        if keepOrChangeWeapon == 1 {
            print("\nOK \(playerName)!")
        } else {
            print("\nPlease select a new weapon in the list below:")
            displayWeaponSetAndChooseAWeapon(withSelected: characterChoice)
        }
    }

    /// This function comes as support to attack() function
    /// It lets player choose to use the weapon contained in chest if presented.
    /// - Parameter characterChoice : an Int value representing an index in an array.
    private func presentChest(with characterChoice: Int) {
        self.team.aliveCharacters[characterChoice - 1].temporaryWeaponSaver = self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter
        print("\nâĄī¸ âĄī¸ âĄī¸ âĄī¸ âĄī¸ âĄī¸ âĄī¸ âĄī¸ âĄī¸ âĄī¸ \nThe Great Spirit đ§ââī¸ just sent a ligthning, and it happened to strike just in front of you. Look \(playerName), a magic chest appearead! đ§°")
        print("It contains a new weapon, but you can't know in advance if it's more or less powerful and accurate than your character's current weapon.")
        print("\nWould you like to use this weapon?\n- Enter 1 to use it\n- Enter 2 to keep your character's current weapon")
        let chooseToUseChest = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: 2, errorMessage:
        """
        â You can only choose 1 to use the new weapon in chest, or 2 to keep your character's current weapon.
        """)
        if chooseToUseChest == 1 {
            self.team.aliveCharacters[characterChoice - 1].temporaryWeaponSaver = self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter
            self.team.aliveCharacters[characterChoice - 1].changeWeaponWithMagicChestWeapon()
        } else {
            print("\nOK \(playerName), you're not a gambler! Your character will attack with last used weapon.")
        }
    }

    /// Displays to user the available weapon to perform an attack, receives as param. an Int value.
    /// - Parameter choice: This value  is to be used as (value - 1) to match chosen character Index in the array of aliveCharacters.
    ///
    /// - createWeaponSet() returns an array of Weapons.
    /// - weapon is chosen by calling setChoice from UserFunctions class.
    /// - chosen character has his weapon changed with changeWeapon()
    private func displayWeaponSetAndChooseAWeapon(withSelected choice: Int) {
        let availableWeapons: [Weapon] = Weapon.createWeaponSet()
        var counter = 0
        print("\nâī¸ Weapon power is the ability for a weapon to remove lifepoints to an ennemy.\nThe accuracy is the abilty for a weapon to actually hit the ennemy.")
        print("The more powerful the weapon, the less accurate.")
        for weaponItem in availableWeapons {
            counter += 1
            print("\(counter) - \(weaponItem.features)")
        }

        let weaponChoice = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: availableWeapons.count, errorMessage:
        """
        â You only have a choice of 5ī¸âŖ weapons. Try again with a number between 1 and 5
        """)

        self.team.aliveCharacters[choice - 1].changeWeapon(with: weaponChoice, in: availableWeapons)
    }

}
