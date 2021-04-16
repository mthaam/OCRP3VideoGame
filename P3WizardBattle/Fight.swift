//
//  Fight.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

class Fight {

    var winner: Player!
    var fightCounter: Int = 0

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

    func winner(in playersArray: [Player]) {
        if playersArray[0].atLeastOneCharacterInTeamIsAlive == true {
            print("\n🔱 Congratulations \(playersArray[0].playerName), you have crushed all of your ennemies!")
            winner = playersArray[0]
        } else {
            print("\n🔱 Congratulations \(playersArray[1].playerName), you have crushed all of your ennemies!")
            winner = playersArray[1]
        }

    }

    func displayBattleFinalStats(in playersArray: [Player]) {
        print("\n\nThe total number of runs is \(fightCounter)")

        print("\n\n   🏆 🏆 🏆 🏆 🏆\n\n   The winner is \(winner!.playerName)\n\n   🏆 🏆 🏆 🏆 🏆")

        print("\n\nNow lets review each team's statistics :")

        for player in playersArray {
            print("\n\n\(player.playerName), your team has the following stats")
            player.team.displayFinalTeamStats()
        }

        print("\n\n Well done players!")

    }

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
