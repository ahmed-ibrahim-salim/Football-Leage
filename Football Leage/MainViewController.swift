//
//  ViewController.swift
//  Football Leage
//
//  Created by Ahmad ibrahim on 26/08/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource& UITableViewDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.dataSource = dataProvider
        mainTableView.delegate = dataProvider
    }
}
