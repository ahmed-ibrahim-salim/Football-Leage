//
//  PlayerDataHelper.swift
//  Football Leage
//
//  Created by Ahmad ibrahim on 26/08/2022.
//

import Foundation

class PlayerDataHelper: DataHelper{
    typealias T = PlayerData
    
    var players = [T]()
    var numOfPlayers: Int { return players.count }
    
    func playerAtIndex(at index: Int) throws -> PlayerData{
        if players.count < 1{
            throw DataAccessError.searchError
        }
        return players[index]
    }

    func player(player: T) throws -> T{
        if players.contains(player){
            return player
        }
        throw DataAccessError.searchError
    }
    
    func insert(item: T) throws -> Int{
        if players.contains(item){
            throw DataAccessError.insertError
        }
        players.append(item)
        guard let index = players.firstIndex(of: item)else{fatalError()}
        return index
    }
    
    func delete(item: T) throws -> T{
        if players.contains(item){
            guard let index = players.firstIndex(of: item)else{fatalError()}
            return players.remove(at: index)
        }
        throw DataAccessError.deleteError
    }
    
    func findAll() -> [T]? {
        if players.count < 1{
            return nil
        }
        return players
    }
}
