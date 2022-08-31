//
//  TeamDataHelper.swift
//  Football Leage
//
//  Created by Ahmad ibrahim on 26/08/2022.
//

import Foundation

class TeamDataHelper: DataHelper{
    typealias T = TeamData
    var teams = [T]()
    var numOfTeams: Int { return teams.count }
    
    func teamAtIndex(at index: Int) throws -> TeamData{
        if teams.count < 1{
            throw DataAccessError.searchError
        }
        return teams[index]
    }
    func team(team: TeamData) throws -> T{
        if teams.contains(team){
            return team
        }
        throw DataAccessError.searchError
    }

    func insert(item: T) throws -> Int{
        if teams.contains(item){
            throw DataAccessError.insertError
        }
        teams.append(item)
        guard let index = teams.firstIndex(of: item)else{fatalError()}
        return index
    }
    
    func delete(item: T) throws -> T{
        if teams.contains(item){
            guard let index = teams.firstIndex(of: item)else{fatalError()}
            return teams.remove(at: index)
        }
        throw DataAccessError.deleteError
    }
    
    func findAll() -> [T]? {
        if teams.count < 1{
            return nil
        }
        return teams
    }
}
