//
//  Player.swift
//  Football Leage
//
//  Created by Ahmad medo on 27/08/2022.
//

import Foundation

struct Player{
    var firstName: String
    var lastName: String
    var playerId: Int?
    var teamId: Int?
    var number: Int?
    var position: Positions?
    var team: Team?
    
    init(firstName: String,lastName: String,playerId: Int? = nil, teamId: Int? = nil,number: Int? = nil,position: Positions? = nil,team: Team? = nil) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.playerId = playerId
        self.teamId = teamId
        self.number = number
        self.position = position
        self.team = team
    }
}
