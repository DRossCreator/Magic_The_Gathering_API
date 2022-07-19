//
//  DetailViewController.swift
//  Magic_The_Gathering_API
//
//  Created by Daniil Yarkovenko on 19.07.2022.
//

import UIKit

final class DetailViewController: UIViewController {

    //MARK: - Private Properties
    var detailView: CardDetailView? {
        guard isViewLoaded else { return nil }
        return view as? CardDetailView
    }

    //MARK: - Lifecycle

    init(model: Card) {
        super.init(nibName: nil, bundle: nil)
        detailView?.configure(with: model)
        navigationConfig()
    }

    override func loadView() {
        view = CardDetailView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DetailViewController {
    func navigationConfig() {
        title = "About Card"
    }
}

