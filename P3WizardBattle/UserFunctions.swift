//
//  UserFunctions.swift
//  P3WizardBattle
//
//  Created by JEAN SEBASTIEN BRUNET on 23/3/21.
//

import Foundation

/// This class is used as a toolbox of reccuring functions, used in every other classes.
/// There are also 2 static var, used to store already used names, for players or characters.
class UserFunctions {

    static var usedPlayerNames: [String] = []
    static var usedCharacterNames: [String] = []

    /// This function returns a String value.
    /// - It is used at game initialization, and also control that name entered after answerWithText()
    /// is not contained in static var [usedPlayerNames].
    /// - Once the program exits repeat - while loop (the conditions are met),
    /// the chosen name is appended to static var [usedPlayerNames], and then name is returned.
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

    /// This function returns an Int value.
    /// It is used in every other classes to ask a choice.
    /// - Parameter minimumChoice : an Int value which is the minimum choice a user can reply with.
    /// - Parameter maximumChoice : an Int value which is the maximum choice a user can reply with.
    /// - Parameter errorMessage : a String value, displayed to a player if the choice he does is not in choice range.
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

    /// This function returns a String value.
    /// - It is used to interact with a user, who can reply with any string value after readline()
    /// - Note that readLine() function is repeated while rawValue == nil.
    /// - Note that rawValue is returned with forced unwrapping because
    /// it is not possible to be returned if nil, so it's safe to return it this way.
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

    /// This function returns an Int value.
    /// - It is used to interact with a user, who can reply with any Int value after readline()
    /// - Note that readLine() function is repeated while rawValue == nil.
    /// - Note that rawValue is returned with forced unwrapping because
    /// it is not possible to be returned if nil, so it's safe to return it this way.
    /// - In repeat while loop, answerWithText() is called first.
    /// - The returned result of answerWithText() is then converted to an Int value in an if let statement.
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

    /// This function returns an Double value.
    /// - It is used to interact with a user, who can reply with any Double value after readline()
    /// - Note that readLine() function is repeated while rawValue == nil.
    /// - Note that rawValue is returned with forced unwrapping because
    /// it is not possible to be returned if nil, so it's safe to return it this way.
    /// - In repeat while loop, answerWithText() is called first.
    /// - The returned result of answerWithText() is then converted to a Double value in an if let statement.
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
