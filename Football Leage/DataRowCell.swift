//
//  DataRowCell.swift
//  Football Leage
//
//  Created by Ahmed ibrahim on 29/08/2022.
//

import UIKit

class DataRowCell: UITableViewCell {
    
    @IBOutlet var titleLbl: UILabel!

    func configCell(title: String) {
        titleLbl.text = title
    }
    
}
