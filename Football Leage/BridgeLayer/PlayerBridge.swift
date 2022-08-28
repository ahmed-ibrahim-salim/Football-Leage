//
//  PlayerBridge.swift
//  Football Leage
//
//  Created by magdy khalifa on 28/08/2022.
//

import Foundation

struct PlayerBridge{
    
    var playerDataHelper: PlayerDataHelper!
    
    init(playerDataHelper: PlayerDataHelper){
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
        let _ = self.toPlayer(playerData: playerData)
        
    }
}
