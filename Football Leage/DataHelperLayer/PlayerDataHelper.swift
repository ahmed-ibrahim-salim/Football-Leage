//
//  PlayerDataHelper.swift
//  Football Leage
//
//  Created by Ahmad medo on 26/08/2022.
//

import Foundation


class PlayerDataHelper: DataHelper{
    typealias T = PlayerData
    
    var players = [T]()
    var numOfPlayers: Int { return players.count }
    
    func player(at index: Int) -> T?{
        return players[index]
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
    
    func findAll() throws -> [T] {
        return players
    }
}
