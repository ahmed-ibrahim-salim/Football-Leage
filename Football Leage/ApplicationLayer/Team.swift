//
//  Team.swift
//  Football Leage
//
//  Created by Ahmad ibrahim on 27/08/2022.
//

import Foundation

struct Team {
    var teamId: Int64?
    var nickName: String
    var city: String?
    
    init(teamId: Int64? = nil, nickName: String, city: String? = nil) {
        self.teamId = teamId
        self.nickName = nickName
        self.city = city
    }
}
