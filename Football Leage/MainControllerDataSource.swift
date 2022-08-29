//
//  MainControllerDataSource.swift
//  Football Leage
//
//  Created by magdy khalifa on 29/08/2022.
//

import Foundation
import UIKit

class MainDataProvider: NSObject , UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
        
    }
}
