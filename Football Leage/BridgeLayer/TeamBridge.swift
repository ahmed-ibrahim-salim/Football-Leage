//
//  TeamBridge.swift
//  Football Leage
//
//  Created by Ahmad ibrahim on 27/08/2022.
//

import Foundation

struct TeamBridge{
    var teamDataHelper: TeamDataHelper!
    
    init(teamDataHelper: TeamDataHelper){
        self.teamDataHelper = teamDataHelper
    }
    
    func toTeamData(team: Team) -> TeamData{
        return TeamData(nickName: team.nickName, teamId: team.teamId,city: team.city)
    }
    func toTeam(teamData: TeamData) -> Team{
        return Team(teamId: teamData.teamId, nickName: teamData.nickName, city: teamData.city)
    }
    
    func save(team: inout Team) throws {
        var teamData = self.toTeamData(team: team)
        
        let index = try teamDataHelper.insert(item: teamData)
        
        teamData.teamId = Int64(index)
        team = self.toTeam(teamData: teamData)
    }
    func delete(team: Team) throws {
        let teamData =  self.toTeamData(team: team)
        let _ = try teamDataHelper.delete(item: teamData)
    }
    func retrieve(team: Team) throws -> Team{
        let teamData = self.toTeamData(team: team)
        let team = try teamDataHelper.team(team: teamData)
        return self.toTeam(teamData: team)
    }
}
