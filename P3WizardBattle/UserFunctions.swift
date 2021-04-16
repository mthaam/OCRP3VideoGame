//
//  UserFunctions.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 23/3/21.
//

import Foundation

class UserFunctions {

    static var usedPlayerNames: [String] = []
    static var usedCharacterNames: [String] = []

    static func askNameForPlayer() -> String {
        var name: String = ""
        repeat {
            name = UserFunctions.answerWithText()
            if name.count < 3 {
                print("\n❌ Your name must have at least 3 letters")
            }
            if usedPlayerNames.contains(name) || usedPlayerNames.contains(name.capitalized) {
                print("\n❌ This name is already used. Please choose another one.")
            }
        } while name.count < 3 || usedPlayerNames.contains(name) || usedPlayerNames.contains(name.capitalized)
        usedPlayerNames.append(name)
        usedPlayerNames.append(name.capitalized)
        return name.capitalized
    }

    static func setChoice(minimumChoice: Int, maximumChoice: Int, errorMessage: String ) -> Int {
        var userChoice: Int
        repeat {
            userChoice = UserFunctions.answerWithIntNumber()
            if userChoice < minimumChoice || userChoice > maximumChoice {
                print(errorMessage)
            }
        } while userChoice < minimumChoice || userChoice > maximumChoice
        return userChoice
    }

    static func answerWithText() -> String {
        var rawValue: String?
        repeat {
            rawValue = readLine()
            if rawValue == nil {
                print("❌ You didn't type anything. Please try again")
            }
        } while rawValue == nil

        return rawValue!
    }

    static func answerWithIntNumber() -> Int {
        var readValue: Int?
        repeat {
            let rawValue = UserFunctions.answerWithText()
            if let value = Int(rawValue) {
                readValue = value
            } else {
                print("❌ You can only answer with a number")
            }
        } while readValue == nil

        return readValue!
    }

    static func answerWithDblNumber() -> Double {
        var readValue: Double?
        repeat {
            let rawValue = UserFunctions.answerWithText()
            if let value = Double(rawValue) {
                readValue = value
            } else {
                print("❌ You can only answer with a number")
            }
        } while readValue == nil

        return readValue!
    }

}
