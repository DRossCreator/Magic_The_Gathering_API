//
//  CardsView.swift
//  Magic_The_Gathering_API
//
//  Created by Daniil Yarkovenko on 18.07.2022.
//

import UIKit

final class CardsTableView: UIView {

    //MARK: - Properties

    lazy var cardsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        addSubview(cardsTableView)
    }

    private func setupLayout() {
        cardsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        cardsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        cardsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        cardsTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardsTableView.rowHeight = 100
    }
    
}
