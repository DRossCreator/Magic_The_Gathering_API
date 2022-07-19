//
//  CardsTableViewController.swift
//  Magic_The_Gathering_API
//
//  Created by Daniil Yarkovenko on 18.07.2022.
//

import UIKit
import Alamofire

final class CardsTableViewController: UIViewController {

    //MARK: - Private Properties

    private var cards: [Card] = []

    private var cardsView: CardsTableView? {
        guard isViewLoaded else { return nil }
        return view as? CardsTableView
    }

    //MARK: - Lifecycle

    override func loadView() {
        view = CardsTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureTable()
        fetchSeries()
    }
}

//MARK: - Private Extensions

private extension CardsTableViewController {

    func configureNavigation() {
        title = "Magic: The Gathering"
    }

    func configureTable() {
        cardsView?.cardsTableView.delegate = self
        cardsView?.cardsTableView.dataSource = self
        
        cardsView?.cardsTableView.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.identifier)
    }

    private func fetchSeries() {
        let request = AF.request("https://api.magicthegathering.io/v1/cards?name=Opt")
        request.responseDecodable(of: Cards.self) { (data) in
            guard let model = data.value else { return }
            let cards = model.cards
            self.cards = cards

            self.cardsView?.cardsTableView.reloadData()
        }
    }
    
}

//MARK: - Extensions

extension CardsTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cards[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as? CardTableViewCell else { return UITableViewCell() }
        cell.configureCell(with: model)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        //не понимаю, почему тут не работает, вроде уже все что можно сделал, либо опять далеко ушел)
        let vc = DetailViewController(model: cards[indexPath.row])

        self.present(vc, animated: true)
    }
}
