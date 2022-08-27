//
//  TeamData.swift
//  Football Leage
//
//  Created by Ahmad medo on 26/08/2022.
//

import Foundation

struct TeamData:Equatable{
    let teamId: Int64
    let nickName: String
    let city: String?
    
    init(nickName: String,teamId: Int64,city: String? = nil){
        self.nickName = nickName
        self.teamId = teamId
        self.city = city
    }
    static func == (lhs: Self, rhs: Self) -> Bool{
        if lhs.teamId == rhs.teamId{
            return true
        }
        if lhs.nickName == rhs.nickName{
            return true
        }
        
        return false
    }
}

struct PlayerData: Equatable{
    let playerId: Int64
    let firstName: String
    let lastName: String
    let number: Int?
    let teamId: Int64?
    let position: Positions?
    
    init(playerId: Int64,firstName: String,lastName: String, number:Int? = nil,teamId: Int64? = nil, position: Positions? = nil) {
        self.teamId = teamId
        self.firstName = firstName
        self.lastName = lastName
        self.number = number
        self.playerId = playerId
        self.position = position
    }
    static func == (lhs: Self, rhs: Self) -> Bool{
        if lhs.playerId == rhs.playerId{
            return true
        }
        if lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName{
            return true
        }
        
        return false
    }

}

enum Positions: String {
    case defender = "Defender"
    case AttackingMidfielder = "Attacking Midfielder"
    case goalKeeper = "Goal Keeper"
}
