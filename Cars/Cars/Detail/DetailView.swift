//
//  DetailView.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

final class DetailView: UIView {
    
    private var presenter: DetailPresenter?
    private var model: DetailModel?
    private var car: Car?
    private let bodies = ["Седан", "Универсал", "Кроссовер", "Хэтчбэк"]
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var avatarImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        return imageView
    }()
    
    private lazy var labelCost : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Inter-Medium.ttf", size: 24)
        titleLabel.text = "Цена"
        return titleLabel
    }()
    
    private lazy var costLabel : UILabel = {
        let authorLabel = UILabel()
        authorLabel.textAlignment = .left
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont(name: "Inter-SemiBold.ttf", size: 16)
        return authorLabel
    }()
    
    private lazy var articleTextView : UILabel = {
        let articleTextView = UILabel()
        articleTextView.translatesAutoresizingMaskIntoConstraints = false
        articleTextView.font = UIFont(name: "Inter-Medium.ttf", size: 16)
        articleTextView.text = "Выберите тип кузова"
        return articleTextView
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.isScrollEnabled = false
        view.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button : UIButton = {
        let imageView = UIButton()
        imageView.setTitle("Рассчитать цену", for: .normal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.backgroundColor = .green
        imageView.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return imageView
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        spinner.startAnimating()
        avatarImage.image = UIImage(named: (car?.image ?? "") )
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) { [weak self] in
            let cells = self?.tableView.visibleCells as! Array<DetailTableViewCell>
            var variable = 0
            for cell in cells {
                if cell.checkbox.isChecked == true {
                    self?.costLabel.text = String(self?.car!.price[variable ] ?? 0) + "$"
                    self?.avatarImage.image = UIImage(named: (self?.car?.image ?? "") + String(variable+1))
                }
                variable += 1
            }
            self?.spinner.stopAnimating()
        }
    }
    
    func configView() {
        self.backgroundColor = Constants.backgroundColor
        setupAvatarImage()
        setupTitleLabel()
        setupCostLabel()
        setupArticleTextView()
        setupButton()
        setupTable()
        setupSpinner()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupAvatarImage() {
        self.addSubview(avatarImage)
        NSLayoutConstraint.activate([
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            avatarImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            avatarImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func setupSpinner(){
        avatarImage.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: avatarImage.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor).isActive = true
    }
    
    private func setupTitleLabel() {
        self.addSubview(labelCost)
        NSLayoutConstraint.activate([
            labelCost.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            labelCost.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            labelCost.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 8),
            labelCost.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.04)
        ])
    }
    
    private func setupCostLabel() {
        self.addSubview(costLabel)
        NSLayoutConstraint.activate([
            costLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            costLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            costLabel.topAnchor.constraint(equalTo: labelCost.bottomAnchor, constant: 8),
            costLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.03)
        ])
    }
    
    private func setupArticleTextView() {
        self.addSubview(articleTextView)
        NSLayoutConstraint.activate([
            articleTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            articleTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            articleTextView.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 8),
        ])
    }
    
    private func setupButton() {
        self.addSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIScreen.main.bounds.height/10),
            button.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
        ])
    }
    
    private func setupTable() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: button.topAnchor),
            tableView.topAnchor.constraint(equalTo: articleTextView.bottomAnchor)
        ])
    }

    func setPresenter(presenter: DetailPresenter, model: DetailModel) {
        self.presenter = presenter
        self.model = model
    }
    
    func loadView(controller: DetailViewController, model: DetailModel) {
        self.presenter = DetailPresenter()
        self.presenter?.loadView(controller: controller, model: model, view: self)
    }
    
    func update(data: Car) {
        avatarImage.image = UIImage(named: data.image + "1")
        costLabel.text = String(data.price[0]) + "$"
        self.car = data
    }
}

extension DetailView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cells = self.tableView.visibleCells as! Array<DetailTableViewCell>

            for cell in cells {
                cell.checkbox.isChecked = false
            }
        
        if let cell = self.tableView.cellForRow(at: indexPath) as? DetailTableViewCell {
            cell.checkbox.buttonClicked()
        }
    }
    
}

extension DetailView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bodies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        cell.setName(name: Array(bodies)[indexPath.row])
        return cell
    }
    
}

private enum Constants {
    static let backgroundColor = UIColor.white
    static let standardSpacing: CGFloat = 16
}
