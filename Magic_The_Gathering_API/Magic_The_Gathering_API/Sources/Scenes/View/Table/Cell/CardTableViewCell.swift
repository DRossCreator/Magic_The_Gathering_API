//
//  CardTableViewCell.swift
//  Magic_The_Gathering_API
//
//  Created by Daniil Yarkovenko on 18.07.2022.
//

import UIKit

final class CardTableViewCell: UITableViewCell {

    //MARK: - Singleton

    static let identifier = "CardTableViewCell"

    //MARK: - Private Properies

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines =  1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines =  1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private Functions
    
    private func setupCell() {
        setupHieracly()
        setupLayout()
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    private func setupHieracly() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(thirdLabel)
    }

    private func setupLayout() {
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        stackView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 1.5).isActive = true
    }

    //MARK: - Public Functions

    public func configureCell(with model: Card) {
        firstLabel.text = model.name
        secondLabel.text = "type: " + (model.type ?? "null")
        thirdLabel.text = "#" + (model.number ?? "null")
    }

}
