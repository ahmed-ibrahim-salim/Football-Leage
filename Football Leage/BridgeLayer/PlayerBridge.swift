//
//  PlayerBridge.swift
//  Football Leage
//
//  Created by Ahmad ibrahim on 28/08/2022.
//

import Foundation

struct PlayerBridge{
    var playerDataHelper: PlayerDataHelper!
    
    init(playerDataHelper: PlayerDataHelper) {
        self.playerDataHelper = playerDataHelper
    }
    
    func toPlayerData(player: Player) -> PlayerData{
        return PlayerData(firstName: player.firstName, lastName: player.lastName)
    }
    func toPlayer(playerData: PlayerData) -> Player{
        return Player(firstName: playerData.firstName, lastName: playerData.lastName)
    }
    func save(player: inout Player) throws{
        var playerData = self.toPlayerData(player: player)
        let id = try playerDataHelper.insert(item: playerData)
        playerData.teamId = Int64(id)
         _ = self.toPlayer(playerData: playerData)
        
    }
    func delete(player: Player) throws{
        let playerData = self.toPlayerData(player: player)
         _ = try self.playerDataHelper.delete(item: playerData)
    }
    func retrieve(player: Player) throws -> Player{
        let playerData = self.toPlayerData(player: player)
        let retrievedPlayer = try self.playerDataHelper.player(player: playerData)
        return self.toPlayer(playerData: retrievedPlayer)
    }
}
