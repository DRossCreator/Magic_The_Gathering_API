//
//  CardsModel.swift
//  Magic_The_Gathering_API
//
//  Created by Daniil Yarkovenko on 18.07.2022.
//

import Foundation

struct Cards: Decodable {
    var cards: [Card]
}

struct Card: Decodable {
    let name: String?
    let type: String?
    let text: String?
    let number: String?
}
