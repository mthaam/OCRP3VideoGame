//
//  Player.swift
//  P3WizardBattle
//
//  Created by SEBASTIEN BRUNET on 23/03/2021.
//

import Foundation

class Player {
    var playerName: String
    var playerScore: Int = 0
    var team: Team!
    var isItPlayersTurn: Bool = false
    var atLeastOneCharacterInTeamIsAlive: Bool {
        team.aliveCharacters[0].isAlive || team.aliveCharacters[1].isAlive || team.aliveCharacters[2].isAlive
    }
    
    
    
    
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
        
        for _ in playersArray {
            if playersArray.first?.playerName == playersArray.last?.playerName {
                print("Players have identical names. Please change name for Player 2")
                playersArray.last?.playerName = UserFunctions.askNameForPlayer()
            }
        }
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
    
    func controlTeamNames(versusTeamOne: [Character]) {
        let teamOne = versusTeamOne
        
        for character in self.team.aliveCharacters {
            if character.characterName == teamOne[0].characterName || character.characterName == teamOne[1].characterName || character.characterName == teamOne[2].characterName  {
                print("Your character \(character.characterType) has a named already used. Please choose a new one")
                repeat {
                    character.characterName = UserFunctions.answerWithText()
                    if character.characterName == teamOne[0].characterName || character.characterName == teamOne[1].characterName || character.characterName == teamOne[2].characterName {
                        print("The name you chose is already used by Player 1. Please try again with a new name different from \(teamOne[0].characterName!), \(teamOne[1].characterName!), \(teamOne[2].characterName!) ")
                    }
                } while character.characterName == teamOne[0].characterName || character.characterName == teamOne[1].characterName || character.characterName == teamOne[2].characterName
            }
        }
    }
    
    
    func attack(againstTeam opposingTeam: Team ) {
        print("\n\(playerName), choose a character of your Team to attack with.")
        self.team.teamDisplay()
        
        var choice: Int = 0
        repeat {
            choice = UserFunctions.setChoice()
            if choice < 1 || choice > 3  {
                print("Your team has just 3 characters! Try again with a number between 1 and 3.")
            }
        } while choice < 1 || choice > 3
        // MAYBE THE REPEAT WHILE CAN BE REFACTORED BY UPGRADING SETCHOICE() MIN-MAX MESSAGE
        
        print("\nNow it's time to choose a weapon. Please select a weapon in the list below:")
        
        let availableWeapons: [Weapon] = Weapon.createWeaponSet()
        var counter = 0
        for weaponItem in availableWeapons {
            counter += 1
            print("\(counter) - \(weaponItem.weaponType)")
        }
        
        var weaponChoice = 0
        repeat {
            weaponChoice = UserFunctions.setChoice()
            if weaponChoice < 1 || weaponChoice > 5  {
                print("You only have a choice of 5️⃣ weapons. Try again with a number between 1 and 5")
            }
        } while weaponChoice < 1 || weaponChoice > 5
        
        self.team.aliveCharacters[choice - 1].changeWeapon(with: weaponChoice, in: availableWeapons)
        
        
        print("\nNow choose a character to attack")
        print("Choose from the characters of the other player:")
        opposingTeam.teamDisplay()
        var choiceOfCharacterToAttack = 0
        repeat {
            choiceOfCharacterToAttack = UserFunctions.setChoice()
            if choice < 1 || choice > 3  {
                print("The opposing team has just 3 characters! Try again with a number between 1 and 3.")
            }
        } while choiceOfCharacterToAttack < 1 || choiceOfCharacterToAttack > 3
        // ! secure choice bc if player chooses a dead character that's an issue!!!!!!!
        
        print("\n\(playerName.capitalized), you are now ready to attack with \(self.team.aliveCharacters[choice - 1].characterName!.capitalized) the \(self.team.aliveCharacters[choice - 1].characterType) and his weapon \(self.team.aliveCharacters[choice - 1].weaponOfCharacter.weaponType), press enter to hit \(opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].characterName!.capitalized) the \(opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].characterType) ")
        
        _ = readLine()
        

        opposingTeam.aliveCharacters[choiceOfCharacterToAttack - 1].receiveHit(from: team.aliveCharacters[choice - 1])
        opposingTeam.isThereACharacterToRemoveFromAliveTeam()
        
        
        isItPlayersTurn.toggle()
        
    }
    
    
    
//    func chooseCharacterAndWeapon(<#parameters#>) -> <#return type#> { // to be refactored with some parts of attack()
//        <#function body#>
//    }
    
    
    
    
    

    

}
