//
//  UserFunctions.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 23/3/21.
//

import Foundation

class UserFunctions {
    
    
    static func setChoice() -> Int {
        var readValue: Int?
        repeat {
            let choice = UserFunctions.answerWithText()
            if let newChoice = Int(choice) {
                readValue = newChoice
            }
            
        } while readValue == nil
        return readValue!
    }
    
    static func answerWithText() -> String {
        var rawValue:String?
        repeat {
            rawValue = readLine()
            if rawValue == nil {
                print("Une valeur doit être saisie")
            }
        } while rawValue == nil
        
        return rawValue!
    }
    
    static func askName() -> String {
        var name: String = ""
        repeat{
            print("Veuillez entrer votre nom")
            name = UserFunctions.answerWithText()
            if name.count < 3 {
                print("Votre nom doit comporter au moins 3 caractères")
            }
        } while name.count < 3
        return name
    }

    
    
    
}
