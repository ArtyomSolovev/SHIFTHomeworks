//
//  TableViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 20.11.2021.
//

import UIKit

final class TableViewController: UITableViewController {

    let animals = Animal.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        self.tableView.rowHeight = 70
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
        cell.animal = animals[indexPath.item]
        cell.backgroundColor = animals[indexPath.item].color
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = DetailViewController()
        VC.animal = animals[indexPath.item]
        self.present(VC,animated: true)
    }
}

