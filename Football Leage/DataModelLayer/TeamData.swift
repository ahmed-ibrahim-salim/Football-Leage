//
//  TeamData.swift
//  Football Leage
//
//  Created by Ahmad ibrahim on 26/08/2022.
//

import Foundation

struct TeamData: Equatable{
    var teamId: Int64?
    var nickName: String
    var city: String?
    
    init(nickName: String, teamId: Int64? = nil, city: String? = nil){
        self.nickName = nickName
        self.teamId = teamId
        self.city = city
    }
    static func == (lhs: Self, rhs: Self) -> Bool{
//        if lhs.teamId == rhs.teamId{
//            return true
//        }
        if lhs.nickName == rhs.nickName{
            return true
        }
        
        return false
    }
}

enum Positions: String {
    case defender = "Defender"
    case attackingMidfielder = "Attacking Midfielder"
    case goalKeeper = "Goal Keeper"
}
