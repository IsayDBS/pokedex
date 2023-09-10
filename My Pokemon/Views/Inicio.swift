//
//  Inicio.swift
//  My Pokemon
//
//  Created by Isay Damar Balderas Salomón on 07/09/23.
//

import SwiftUI

struct Inicio:View{
    @State var pokemonList: PokemonList?
    
    var pokemons = [
        PokemonName(name: "Juan"),
        PokemonName(name: "Pepe")
    ]
    
    var body:some View{
        NavigationStack{
            ZStack{
                Color.red.ignoresSafeArea()
                VStack{
                    Lights()
                    Top()
                        .stroke(Color.black, lineWidth: 2)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .padding(.top, -30)
                    Triangle()
                        .fill(.yellow)
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(-90))
                        .padding(.leading, -190.0)
                        .padding(.top, 250)
                        .task {
                            do{
                                pokemonList = try await getPokemons()
                                //print(pokemonList ?? "")
                            } catch GHError.invalidData{
                                print("Invalid data")
                            } catch GHError.invalidResponse{
                                print("Invalid response")
                            } catch GHError.invalidURL{
                                print("Invalid url")
                            } catch {
                                print("Unexpected error")
                            }
                        }
                    List(pokemonList?.results ?? pokemons)
                    { pokemon in
                        NavigationLink(pokemon.name.capitalized,
                                       destination: Pokedex(pokemonName: pokemon.name))
                            .listRowBackground(Color.gray.opacity(0.7))
                            .listRowSeparatorTint(Color.black)
                    }.frame(width: 250, height: 500)
                        .background(.red)
                        .scrollContentBackground(.hidden)
                        .padding(.top, -350)
                    Spacer()
                }
            }/*Limite de navigation stack*/
        }
    }
}

struct Inicio_Previews: PreviewProvider{
    static var previews: some View{
        Inicio()
    }
}
