//
//  Game.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 19/3/21.
//
// swiftlint:disable all

import Foundation

/// This class manages the whole game through 3 properties and one main function : gameManager
class Game {

    var isOver: Bool = false
    var playersArray: [Player] = []
    var fight: Fight = Fight()

    /// Content of  main function gameManager()  is repeated indefinitely while class' property isOver == false
    func gameManager() {
        while isOver == false {
            launchGame()
            battle()
            exitOrNewGame()
        }
    }

    /// launchGame()  is the function that creates an array of Player objects.
    /// - var playersArray above is modified by static function createPlayersArray()
    /// - Then for each player of playersArray, function chooseTeam is called.
    /// - Once team is set, team is reviewed for each player with teamReview()
    private func launchGame() {
        print("\n⚔️ Welcome to Wizard Battle! ⚔️")
        print("\nPlease enter names for players")

        playersArray = Player.createPlayersArray()

        print("\nNow please choose a team for each player 👨‍👨‍👦")
        print("Each player can choose 3️⃣ characters for his team")

        for player in playersArray {
            player.chooseTeam()
        }

        print("\n\n\(playersArray[0].playerName.capitalized) and \(playersArray[1].playerName.capitalized), you are almost ready to fight. Let's review your teams first.")

        for player in playersArray {
            player.teamReview()
        }
    }

    /// battle() function calls 3 functions from class Fight.
    /// - initiateFight() makes the characters of one player's team fight.
    /// - winner() determines which player is the winner.
    /// - displayBattleFinalStats() displays game stats at the end.
    private func battle() {
        fight.initiateFight(withPlayers: playersArray)
        fight.winner(in: playersArray)
        fight.displayBattleFinalStats(in: playersArray)
    }

    /// exitOrNewGame is the last called function of gameManager().
    ///
    /// It allow users to start a new game with new player names and teams, or exit the game by mutating var isOver to true.
    private func exitOrNewGame() {
        print("\n\nWhat would you like to do now?\n\n- Enter 1 to start a new game\n\n- Enter 2 to exit game")

        let choice = UserFunctions.setChoice(minimumChoice: 1, maximumChoice: 2, errorMessage: "❌ You can only answer with 1 to start a new game, or 2 to exit game. Please try again.")
        if choice == 1 {
            playersArray.removeAll()
            UserFunctions.usedCharacterNames.removeAll()
            UserFunctions.usedPlayerNames.removeAll()
            fight.fightCounter = 0
        } else {
            print("Goodbye! 👋")
            isOver = true
        }
    }

}
