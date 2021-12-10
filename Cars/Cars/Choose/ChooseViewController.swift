//
//  ViewController.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

class ChooseViewController: UIViewController {

    private var data = Car.sampleData
    private var viewChoose: ChooseView?
    
    init(){
        self.viewChoose = ChooseView(frame:UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.viewChoose?.loadView(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 25)!]
        self.title = "Выберите"
        if let viewChoose = viewChoose {
            self.view.addSubview(viewChoose)
        }
        viewChoose?.configure()
        viewChoose?.tableView.delegate = self
        viewChoose?.tableView.dataSource = self
    }

}

extension ChooseViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: -TODO
        let postVC = DetailViewController(car: data[indexPath.row])//(post: data[indexPath.row])
        navigationController?.pushViewController(postVC, animated: true)
    }
    
}

extension ChooseViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseTableViewCell.identifier, for: indexPath) as! ChooseTableViewCell
        cell.post = self.data[indexPath.row]
        return cell
    }
    
    
}





