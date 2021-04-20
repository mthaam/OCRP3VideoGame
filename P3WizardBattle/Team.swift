//
//  Team.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//
// swiftlint:disable all

import Foundation

/// This class creates a team, whic consist in 2 arrays ;
/// One for alive characters, One for dead characters.
final class Team {

    var aliveCharacters: [Character] = []
    var deadCharacters: [Character] = []

    /// This function lets player choose characters for his team.
    /// It returns an instance of type Team.
    /// - First an empty Character array and a Team instance  are declared.
    /// - Then, code within repeat - while is repeated while .count of Character array < 3.
    /// - Each time loop is processed, a new array of available Characters is created with displayAvailableCharacters()
    /// - Player then chooses a player with setChoice(), which returns an Int value.
    /// - The Int value serves as an index reference used in switch statement and
    /// - Character.addCharacterAndName() is called for each switch case.
    /// - Last step is to make aliveCharacters = newCharacterSet.
    static func chooseCharactersForPlayersTeam() -> Team {

        var newCharacterSet: [Character] = []
        let newTeam = Team()

        var counter: Int = 0
        repeat {
            counter += 1
            print("\nPlease choose character \(counter) and press Enter")

            let characterSet: [Character] = Character.displayAvailableCharacters()
            var userChoice: Int = 0

            userChoice = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: 6, errorMessage: "❌ Your choice is out of range. Please try again with a choice between 1 and 6")

            switch userChoice {
            case 1:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[0], in: newCharacterSet)
            case 2:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[1], in: newCharacterSet)
            case 3:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[2], in: newCharacterSet)
            case 4:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[3], in: newCharacterSet)
            case 5:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[4], in: newCharacterSet)
            case 6:
                newCharacterSet = Character.addCharacterAndName(withChoice: characterSet[5], in: newCharacterSet)
            default:
                break
            }

        } while newCharacterSet.count < 3

        newTeam.aliveCharacters = newCharacterSet

        return newTeam
    }

    /// This function is called in attack() from class Player.
    /// Either it displays available characters still alive to perform an attack,
    /// or it displays available characters still alive to be attacked.
    func teamDisplay() {
        for (index, characterItem) in aliveCharacters.enumerated() {
            print("\(index + 1) - \(characterItem.characterName) the \(characterItem.characterType)")
        }
    }

    /// This function removes dead characters from aliveCharacters array
    /// to deadCharacters array.
    func isThereACharacterToRemoveFromAliveTeam() {
        for (index, character) in aliveCharacters.enumerated() where character.isAlive == false {
            deadCharacters.append(character)
            aliveCharacters.remove(at: index)
        }
    }

    /// This function is called after a character is hit, as a brief reminder of basic life stats of the attacked team.
    /// - Note that guard statement prevents this function to be executed if all characters in a team are dead,
    /// e.g. at the last fight before displaying final stats.
    func displayTeamStats(of oppositePlayerName: String) {
        guard aliveCharacters.count > 0 else { return }
        print("\nThe remaining characters of \(oppositePlayerName)'s team have the following stats")
        for character in aliveCharacters {
            print("\(character.characterName) the \(character.characterType) has \(character.lifePoints)/10  points of life remaining")
        }
    }

    /// This function is called to display stats when a fight is over
    /// (whenever all characters of a team are dead).
    /// - readCharacterStatsAtEndOfGame() is called for each character,
    /// either in aliveCharacters or deadCharacters arrays.
    func displayFinalTeamStats() {
        if aliveCharacters.count > 0 {
            print("\nYou had \(aliveCharacters.count) who survived 💪 :")
            for character in aliveCharacters {
                character.readCharacterStatsAtEndOfGame()
            }
            print("\nYou also had \(deadCharacters.count) who were killed ☠️ :")
            for character in deadCharacters {
                character.readCharacterStatsAtEndOfGame()
            }
        } else {
            print("\nAll character in your team were killed ☠️")
            for character in deadCharacters {
                character.readCharacterStatsAtEndOfGame()
            }
        }
    }

}
