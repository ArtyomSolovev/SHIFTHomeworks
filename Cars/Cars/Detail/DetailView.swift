//
//  DetailView.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

final class DetailView: UIView {
    
    private weak var controller: DetailViewController?
    
    private lazy var avatarImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Inter-Medium.ttf", size: 24)
        return titleLabel
    }()
    
    private lazy var authorLabel : UILabel = {
        let authorLabel = UILabel()
        authorLabel.textAlignment = .left
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont(name: "Inter-SemiBold.ttf", size: 16)
        return authorLabel
    }()
    
    private lazy var articleTextView : UITextView = {
        let articleTextView = UITextView()
        articleTextView.translatesAutoresizingMaskIntoConstraints = false
        articleTextView.font = UIFont(name: "Inter-Medium.ttf", size: 16)
        articleTextView.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        return articleTextView
    }()
    
    func configView() {
        self.backgroundColor = Constants.backgroundColor
        setupAvatarImage()
        setupTitleLabel()
        setupAuthorLabel()
        setupArticleTextView()
    }
    
    private func setupAvatarImage() {
        self.addSubview(avatarImage)
        NSLayoutConstraint.activate([
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            avatarImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 48),
            avatarImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            titleLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 32),
            titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.04)
        ])
    }
    
    private func setupAuthorLabel() {
        self.addSubview(authorLabel)
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.03)
        ])
    }
    
    private func setupArticleTextView() {
        self.addSubview(articleTextView)
        NSLayoutConstraint.activate([
            articleTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.standardSpacing),
            articleTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.standardSpacing),
            articleTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            articleTextView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
    }
    
    func loadView(controller: DetailViewController) {
        self.controller = controller
    }
    
    func update(data: Car) {
        avatarImage.image = UIImage(named: data.image)
        titleLabel.text = data.title
        authorLabel.text = data.author
        articleTextView.text = data.article
    }
}

private enum Constants {
    static let backgroundColor = UIColor.white
    static let standardSpacing: CGFloat = 16
}
