//
//  CardDetailView.swift
//  Magic_The_Gathering_API
//
//  Created by Daniil Yarkovenko on 18.07.2022.
//

import UIKit

final class CardDetailView: UIView {

    //MARK: - Private Properties

    private lazy var cardView: UIView = {
        let cardView = UIView()
        cardView.layer.cornerRadius = 30
        cardView.backgroundColor = .black
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemGroupedBackground
        stackView.layer.cornerRadius = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.numberOfLines =  1
        return label
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 5
        return label
    }()

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.numberOfLines =  1
        return label
    }()

    //MARK: - UIVIew Initialization

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    //MARK: - Private Functions

    private func commonInit() {
        setupView()
        setupHieracly()
        setupLayout()
    }

    private func setupView() {
        backgroundColor = .systemBackground
    }

    private func setupHieracly() {
        addSubview(cardView)
        cardView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(numberLabel)

    }

    private func setupLayout() {
        cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        cardView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        cardView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:  -50).isActive = true

        stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15).isActive = true
        stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -15).isActive = true
        
    }

    public func configure(with model: Card) {
        nameLabel.text = model.name
        typeLabel.text = model.type
        textLabel.text = model.text
        numberLabel.text = model.number
    }

}
