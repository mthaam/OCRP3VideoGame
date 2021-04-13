//
//  Player.swift
//  P3WizardBattle
//
//  Created by SEBASTIEN BRUNET on 23/03/2021.
//

import Foundation

class Player {
    var playerName: String
    var team: Team!
    var isItPlayersTurn: Bool = false
    var atLeastOneCharacterInTeamIsAlive: Bool { team.aliveCharacters.count > 0 }
    private let immutableChestLockKey: Int = 5
    
    
    
    
    
    init(newPlayerName: String) {
        self.playerName = newPlayerName
    }
    
    static func createPlayersArray() -> [Player] {
        var playersArray: [Player] = []
        repeat {
            for count in 1...2 {
                print("Now enter name for player \(count) and press Enter")
                playersArray.append(Player(newPlayerName: UserFunctions.askNameForPlayer()))
            }

        } while playersArray.count < 2
        
        
        return playersArray
    }
    
    
    func chooseTeam() {
        print("\n\nPlease choose characters for player \(playerName.capitalized)")
        team = Team.chooseCharactersForPlayersTeam()
        print("\nCongratulations \(playerName.capitalized), your team is all set!")
    }
    
    func teamReview() {
        print("\n\(playerName.capitalized), Your team now has the following characters")
        for character in team.aliveCharacters {
            print(" \(character.characterName!) the \(character.characterType)")
        }
    }
        
    
    func attack(againstTeam opposingTeam: Team ) {
        let randomlyGeneratedChestOpeningKey: Int = Int.random(in: 1...10)
        var temporaryWeaponSaver: Weapon!
        
        print("\n\(playerName), choose a character of your Team to attack with.")
        self.team.teamDisplay()
        
        let characterChoice: Int = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: self.team.aliveCharacters.count, errorMessage: "Your team has just \(team.aliveCharacters.count) characters! Try again with a number between 1 and \(team.aliveCharacters.count).")

        
        if self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter == nil {
            print("\nNow it's time to choose a weapon. Please select a weapon in the list below:")
            displayWeaponSetAndChooseAWeapon(withSelected: characterChoice)
            
        } else {
            if immutableChestLockKey == randomlyGeneratedChestOpeningKey {
                temporaryWeaponSaver = self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter
                print("\n⚡️ The Great Spirit just sent a ligthning, and it happened to strike just in front of you. Look \(playerName), a magic chest appearead! 🧰")
                print("It contains a new weapon, but you can't know in advance if it's more or less powerful and accurate than your character's current weapon.")
                print("\nWould you like to use this weapon?\n- Enter 1 to use it\n- Enter 2 to keep your character's current weapon")
                let chooseToUseChest = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: 2, errorMessage: "You can only choose 1 to use the new weapon in chest, or 2 to keep your character's current weapon.")
                if chooseToUseChest == 1 {
                    self.team.aliveCharacters[characterChoice - 1].changeWeaponWithMagicChestWeapon()
                } else {
                    print("\nOK \(playerName), you're not a gambler!")
                }
                
            } else {
                print("\nYour selected character \(self.team.aliveCharacters[characterChoice - 1].characterName!) has the weapon \(self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter!.features)")
                print("Would you like to keep or change this weapon?")
                print("Enter 1 to keep - Enter 2 to change")
                let keepOrChangeWeapon = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: 2, errorMessage: "You can only choose 1 to keep your character's current weapon, or 2 to keep it. Please try again.")
                if keepOrChangeWeapon == 1 {
                    print("\nOK \(playerName)!")
                } else {
                    print("\nPlease select a new weapon in the list below:")
                    displayWeaponSetAndChooseAWeapon(withSelected: characterChoice)
                }
            }
        }
        
       
        print("\nNow choose a character to attack")
        print("Choose from the characters of the other player:")
        opposingTeam.teamDisplay()
        let choiceOfCharacterToAttack = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: opposingTeam.aliveCharacters.count, errorMessage: "The opposing team has just \(opposingTeam.aliveCharacters.count) characters! Try again with a number between 1 and \(opposingTeam.aliveCharacters.count).")
        
        print("\n\(playerName.capitalized), you are now ready to attack with \(self.team.aliveCharacters[characterChoice - 1].characterName!.capitalized) the \(self.team.aliveCharacters[characterChoice - 1].characterType) and his weapon \(self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter.weaponType), press enter to hit \(opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].characterName!.capitalized) the \(opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].characterType) ")
        
        _ = readLine()
        

        opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].receiveHit(by: playerName, from: team.aliveCharacters[characterChoice - 1])
        team.aliveCharacters[characterChoice - 1].incrementGivenHits()
        
        if temporaryWeaponSaver != nil {
            print("\nJust so you know \(playerName.capitalized), your character got back the weapon he had before opening the chest. Next time you attack with him, he will use \(temporaryWeaponSaver.features) unless you choose another weapon.")
            self.team.aliveCharacters[characterChoice - 1].weaponOfCharacter = temporaryWeaponSaver
        }
        opposingTeam.isThereACharacterToRemoveFromAliveTeam()
        isItPlayersTurn.toggle()
        
    }
    
    private func displayWeaponSetAndChooseAWeapon(withSelected choice: Int) {
        let availableWeapons: [Weapon] = Weapon.createWeaponSet()
        var counter = 0
        print("\n⁉️ Weapon power is the ability for a weapon to remove lifepoints to an ennemy.\nThe accuracy is the abilty for a weapon to actually harm the ennemy.")
        print("The more powerful the weapon, the less accurate it will be.")
        for weaponItem in availableWeapons {
            counter += 1
            print("\(counter) - \(weaponItem.features)")
        }
        
        let weaponChoice = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: availableWeapons.count, errorMessage: "You only have a choice of 5️⃣ weapons. Try again with a number between 1 and 5")
        
        self.team.aliveCharacters[choice - 1].changeWeapon(with: weaponChoice, in: availableWeapons)
    }

    
    
    
    
    

    

}
