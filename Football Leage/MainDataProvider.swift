//
//  MainControllerDataSource.swift
//  Football Leage
//
//  Created by Ahmed ibrahim on 29/08/2022.
//

import Foundation
import UIKit

enum Section: Int{
    case teams
    case players
}

class MainDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource{
    var teamBridge: TeamBridge?
    var playerBridge: PlayerBridge?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemSection = Section(rawValue: section)else{fatalError()}
        
        switch itemSection{
        case .teams:
            return teamBridge?.teamsCount ?? 0
        case .players:
            return playerBridge?.playersCount ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataRowCell") as! DataRowCell
        
        guard let section = Section(rawValue: indexPath.section) else{fatalError()}
        
        guard let playerBridge = playerBridge, let teamBridge = teamBridge else {
            return UITableViewCell()}
        
        do{
            
            switch section {
            case .teams:
                let team = try teamBridge.retrieveByIndex(at: indexPath.row)
                cell.configCell(title: team.nickName)
            case .players:
                let player = try playerBridge.retrieveByIndex(at: indexPath.row)
                cell.configCell(title: "\(player.firstName) \(player.lastName)")
            }
            
        }catch{
            
        }
        
        return cell
    }
}