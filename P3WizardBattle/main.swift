//
//  main.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 18/3/21.
//

import Foundation

func launchGame() {
    
    print("Bienvenue dans Wizard Battle!")
    print("Veuillez entrer le nom des joueurs")
    
    let player1Team: Team = Team(newTeam: [])
    let player2Team: Team = Team(newTeam: [])
    
    let player1: Player = Player(newPlayerName: UserFunctions.askName())
    let player2: Player = Player(newPlayerName: UserFunctions.askName())

    if player1.playerName == player2.playerName {
        print("Vos noms sont identiques, un joueur doit changer de nom")
        print("Le deuxieme joueur doit changer de nom")
        player2.playerName = ""
    }
    
   
    
}


launchGame()
