//
//  Pokedex.swift
//  My Pokemon
//
//  Created by Isay Damar Balderas Salomón on 07/09/23.
//

import SwiftUI

struct Pokedex: View{
    var pokemonName: String
    @State private var pokemon: Pokemon?
    var tipos = [
        Types(type: Tipo(name: "normal"))
    ]
    
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            ScrollView{
                VStack{
                    Lights()
                    Top()
                        .stroke(Color.black, lineWidth: 2)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .padding(.top, -30)
                    Text((pokemon?.name.capitalized ?? "") + " #" + String(pokemon?.id ?? 0))
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .frame(width:350)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.systemBackground)))
                    AsyncImage(url: URL(string: pokemon?.sprites.other.officialArtwork.frontDefault ?? "")){image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.secondary)
                    }
                    .frame(width:350, height:350)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(25)
                    .task {
                        do{
                            pokemon = try await getPokemon(name: pokemonName)
                            //print(pokemon)
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
                    VStack{
                        Text("Types")
                            .font(.system(size: 30))
                            .font(.title3)
                            .fontWeight(.heavy)
                            .padding(.leading, -140)
                        HStack{
                            ForEach(pokemon?.types ?? tipos) { poke in
                                Image(poke.type.name)
                            }
                        }
                        Text("")
                    }
                    .frame(width:350)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.systemBackground)))
                    Spacer()
                        .frame(height: 10)
                    VStack{
                        Text("Characteristics")
                            .font(.system(size: 30))
                            .font(.title3)
                            .fontWeight(.heavy)
                            .padding(.leading, -100)
                        HStack{
                            Text("Weight: " + String(pokemon?.weight ?? 0) + " kg")
                                .padding(.leading, -150)
                                .font(.system(size:30))
                            }
                        HStack{
                            Text("Height: " + String(pokemon?.height ?? 0) + " m")
                                .padding(.leading, -150)
                                .font(.system(size:30))
                            }
                        Text("")
                        }
                    .frame(width:350)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.systemBackground)))
                    Spacer()
                }
            }
        }
    }
}


struct Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Pokedex(pokemonName: "pikachu")
    }
}

