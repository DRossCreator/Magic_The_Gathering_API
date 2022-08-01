//
//  DetailViewController.swift
//  Magic_The_Gathering_API
//
//  Created by Daniil Yarkovenko on 19.07.2022.
//

import UIKit

final class DetailViewController: UIViewController {

    var model: Card?

    //MARK: - Private Properties
    var detailView: CardDetailView? {
        guard isViewLoaded else { return nil }
        return view as? CardDetailView
    }

    //MARK: - Lifecycle

    override func loadView() {
        view = CardDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationConfig()
        detailViewConfig()
    }
}

private extension DetailViewController {

    func navigationConfig() {
        title = "About Card"
    }

    func detailViewConfig() {
        detailView?.configure(with: model!)
    }
}

