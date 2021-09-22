//
//  GnomeEntity.swift
//  Brastlewark
//
//  Created by Guido Fabio on 18/07/2021.
//

import Foundation

// One gnome
struct GnomeEntity: Codable {
    let id: Int
    let name: String
    let thumbnail: URL
    let age: Int
    let weight: Double
    let height: Double
    let hairColor: String
    let professions: [String]
    let friends: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case age
        case weight
        case height
        case hairColor = "hair_color"
        case professions
        case friends
    }
}

// All gnomes from Brastlewark
struct GnomesEntity: Codable {
    let brastlewark: [GnomeEntity]
    
    enum CodingKeys: String, CodingKey {
        case brastlewark = "Brastlewark"
    }
}
