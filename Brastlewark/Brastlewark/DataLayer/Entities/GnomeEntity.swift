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
    let thumbnail: String
    let age: Int
    let weight: Double
    let height: Double
    let hair_color: String
    let professions: [String]
    let friends: [String]
}

// All gnomes from Brastlewark
struct GnomesEntity: Codable {
    let Brastlewark: [GnomeEntity]
}
