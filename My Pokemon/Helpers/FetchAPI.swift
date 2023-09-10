//
//  FetchAPI.swift
//  My Pokemon
//
//  Created by Isay Damar Balderas Salomón on 06/09/23.
//

import SwiftUI

func getPokemons() async throws -> PokemonList{
    let endpoint = "https://pokeapi.co/api/v2/pokemon?limit=1008"
    
    guard let url = URL(string: endpoint) else {throw GHError.invalidURL}
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
        throw GHError.invalidResponse
    }
    
    do{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(PokemonList.self , from: data)
    }catch{
        throw GHError.invalidData
    }
}


func getPokemon(name: String) async throws -> Pokemon{
    let endpoint = "https://pokeapi.co/api/v2/pokemon/" + name
    
    guard let url = URL(string: endpoint) else {throw GHError.invalidURL}
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw GHError.invalidResponse
    }
    
    do{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Pokemon.self, from:data)
    } catch {
        throw GHError.invalidData
    }
}


struct GithubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}

enum GHError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}
