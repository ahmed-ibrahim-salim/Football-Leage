//
//  Team.swift
//  Football Leage
//
//  Created by Ahmad medo on 27/08/2022.
//

import Foundation

struct Team {
    var teamId: Int
    var nickName: String?
    var city: String?
    
    init(teamId: Int,nickName: String,city: String? = nil) {
        self.teamId = teamId
        self.nickName = nickName
        self.city = city
    }
}
