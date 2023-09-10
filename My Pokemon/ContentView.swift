//
//  ContentView.swift
//  My Pokemon
//
//  Created by Isay Damar Balderas Salomón on 06/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemon: Pokemon?
    
    var body: some View {
        Inicio()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
