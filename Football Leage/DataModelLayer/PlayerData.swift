//
//  PlayerData.swift
//  Football Leage
//
//  Created by Ahmad ibrahim on 28/08/2022.
//

import Foundation

struct PlayerData: Equatable{
    var playerId: Int64?
    var firstName: String
    var lastName: String
    var number: Int?
    var teamId: Int64?
    var position: Positions?
    
    init(playerId: Int64? = nil, firstName: String, lastName: String, number: Int? = nil,
         teamId: Int64? = nil, position: Positions? = nil) {
        self.teamId = teamId
        self.firstName = firstName
        self.lastName = lastName
        self.number = number
        self.playerId = playerId
        self.position = position
    }
    static func == (lhs: Self, rhs: Self) -> Bool{
//        if lhs.playerId == rhs.playerId{
//            return true
//        }
        if lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName{
            return true
        }
        
        return false
    }

}
