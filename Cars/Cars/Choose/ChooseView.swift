//
//  ChooseView.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

protocol IChooseView: UIView {
    var getNumberOfRowsHandler: (() -> Int)? { get set }
    var getContentForCellHandler: ((Int) -> Car)? { get set }
    var onTouchedHandler: ((Int) -> Void)? { get set }
}

final class ChooseView: UIView {
    
    private var presenter: ChoosePresenter?
    var getNumberOfRowsHandler: (() -> Int)?
    var getContentForCellHandler: ((Int) -> Car)?
    var onTouchedHandler: ((Int) -> Void)?
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.register(ChooseTableViewCell.self, forCellReuseIdentifier: ChooseTableViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = 77.0
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension ChooseView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onTouchedHandler?(indexPath.item)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ChooseView: IChooseView {}

extension ChooseView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.getNumberOfRowsHandler?() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseTableViewCell.identifier, for: indexPath) as! ChooseTableViewCell
        if let car = self.getContentForCellHandler?(indexPath.row) {
            cell.setCar(car: car)
        }
        return cell
    }
    
    
}
