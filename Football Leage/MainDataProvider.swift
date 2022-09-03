//
//  MainControllerDataSource.swift
//  Football Leage
//
//  Created by Ahmed ibrahim on 29/08/2022.
//

import UIKit

enum Section: Int{
    case teams
    case players
}

class MainDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource{
    var teamBridge: TeamBridge?
    var playerBridge: PlayerBridge?
    
    func addNewTeam(team: inout Team) throws{
        let teamDataHelper = TeamDataHelper()
        teamBridge = TeamBridge(teamDataHelper: teamDataHelper)
        try teamBridge?.save(team: &team)
    }
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
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        guard let section = Section(rawValue: indexPath.section)else{fatalError()}
        switch section {
        case .teams:
            return "Delete Team"
        case .players:
            return "Delete Player"
        }
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        do{
            guard let teamBridge = teamBridge else {fatalError()}
            guard let playerBridge = playerBridge else {fatalError()}
            guard let section = Section(rawValue: indexPath.section)else{fatalError()}
            
            switch section {
            case .teams:
                let team = try teamBridge.retrieveByIndex(at: indexPath.row)
                if editingStyle == .delete{
                    try teamBridge.delete(team: team)
                }
            case .players:
                let player = try playerBridge.retrieveByIndex(at: indexPath.row)
                if editingStyle == .delete{
                    try playerBridge.delete(player: player)
                }
            }
            
        }catch{
            
        }
        
    }
}
