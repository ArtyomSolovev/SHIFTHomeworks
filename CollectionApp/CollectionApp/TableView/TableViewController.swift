//
//  TableViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 20.11.2021.
//

import UIKit

final class TableViewController: UITableViewController {

    let animals = Animal.data
    let groupSection = ["Хищники","Травоядные"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        self.tableView.rowHeight = 70
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return animals[0].count
        } else{
            return animals[1].count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
        cell.animal = animals[indexPath.section][indexPath.item]
        cell.backgroundColor = animals[indexPath.section][indexPath.item].color
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.groupSection[section]
        return section
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .gray
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Конец секции " + self.groupSection[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        groupSection.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = DetailViewController()
        VC.animal = animals[indexPath.section][indexPath.item]
        self.present(VC,animated: true)
    }
}

