//
//  Fight.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//
// swiftlint:disable all

import Foundation

/// This class manages a fight, consisting in a sucession of attacks one player after the other.
/// - Note that var winner is an implicitly unwrapped optional on purpose.
/// var winner is indeed called only if there's one, so it's safe to call it unwrapped.
final class Fight {

    var winner: Player?
    var fightCounter: Int = 0

    /// This function makes players fight with their respective teams.
    /// - Parameter playersArray : receives an array of Player type
    /// - A player is randomly chosen to play first with chooseRandomFirstPlayer()
    /// - Then attack(), displayTeamStats(), isItPlayersTurn.toggle()
    /// are repeated conditionnally one player after the other.
    func initiateFight(withPlayers playersArray: [Player]) {
        print("\n\n🔮 🔮 🔮 🔮 🔮 🔮 🔮")
        print("\nTime to play! Now just press enter to know who the Great Spirit 🧞‍♂️ has chosen to play first. 🎲 🎲")

        chooseRandomFirstPlayer(in: playersArray)

        while playersArray[0].atLeastOneCharacterInTeamIsAlive == true && playersArray[1].atLeastOneCharacterInTeamIsAlive == true {
            fightCounter += 1
            print("\n🏰 🏰 🏰 🏰 🏰 ")
            print("Fight \(fightCounter)")
            print("🏰 🏰 🏰 🏰 🏰 ")
            if  playersArray[0].isItPlayersTurn == true {
                playersArray[0].attack(againstTeam: playersArray[1].team)
                playersArray[1].team.displayTeamStats(of: playersArray[1].playerName)
                playersArray[1].isItPlayersTurn.toggle()
            } else {
                playersArray[1].attack(againstTeam: playersArray[0].team)
                playersArray[0].team.displayTeamStats(of: playersArray[0].playerName)
                playersArray[0].isItPlayersTurn.toggle()
            }
        }
    }

    /// This function determines which player is the winner in given parameter.
    /// - Parameter playersArray : receives an array of Player type
    /// var winner from Fight class is given a value depending on the condition
    /// of the if / else statement
    func winner(in playersArray: [Player]) {
        if playersArray[0].atLeastOneCharacterInTeamIsAlive == true {
            print("\n🔱 Congratulations \(playersArray[0].playerName), you have crushed all of your ennemies!")
            winner = playersArray[0]
        } else {
            print("\n🔱 Congratulations \(playersArray[1].playerName), you have crushed all of your ennemies!")
            winner = playersArray[1]
        }
    }

    /// This functions displays final stats.
    /// - Parameter playersArray : receives an array of Player type
    /// - For each player in the array called in parameter, the function
    /// displayFinalTeamStats() from class Team is called.
    func displayBattleFinalStats(in playersArray: [Player]) {
        print("\n\nThe total number of runs is \(fightCounter)")

        if let winner2 = self.winner {
            print("\n\n   🏆 🏆 🏆 🏆 🏆\n\n   The winner is \(winner2.playerName)\n\n   🏆 🏆 🏆 🏆 🏆")
        }

        print("\n\nNow lets review each team's statistics :")

        for player in playersArray {
            print("\n\n\(player.playerName), your team has the following stats")
            player.team.displayFinalTeamStats()
        }

        print("\n\n Well done players!")
    }

    /// This function chooses a random first player in the array of players called.
    /// - Parameter playersArray : receives an array of Player type
    /// - A random number is created in range 1...2,
    /// so there is one chance out of 2 that one player starts first based
    /// on the if / else statement.
    /// - Note that readline() stops the program to interact with users and make
    /// them believe that a spirit chooses a player ; see initiatefight() function
    private func chooseRandomFirstPlayer(in playersArray: [Player]) {
        let randomNumber: Int = Int.random(in: 1...2)
        _ = readLine()

        if randomNumber == 1 {
            print("\n👉 The Great Spirit 🧞‍♂️ has chosen you \(playersArray[0].playerName.capitalized), you will start the fight!")
            playersArray[0].isItPlayersTurn = true

        } else {
            print("\n👉 The Great Spirit has chosen you \(playersArray[1].playerName.capitalized), you will start the fight!")
            playersArray[1].isItPlayersTurn = true
        }
    }

}
