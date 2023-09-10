//
//  Pokemon.swift
//  My Pokemon
//
//  Created by Isay Damar Balderas Salomón on 07/09/23.
//

import Foundation

struct OfficialArtwork: Codable{
    let frontDefault: String
}

/*
 Special case of kabeb case
 */
struct Other: Codable{
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey{
        case officialArtwork = "official-artwork"
    }
}

struct Sprites: Codable{
    let frontDefault: String
    let other: Other
}

struct Tipo: Codable{
    let name: String
}

struct Types: Codable, Identifiable{
    let id = UUID()
    let type: Tipo
    
    enum CodingKeys: String, CodingKey{
        case type = "type"
    }
}

struct Pokemon: Codable , Identifiable{
    let id: Int
    let height: Int
    let weight: Int
    let name: String
    let sprites: Sprites
    let types: [Types]
}

struct PokemonName: Codable, Identifiable{
    let id = UUID()
    let name: String
}

struct PokemonList: Codable{
    let results: [PokemonName]
}


