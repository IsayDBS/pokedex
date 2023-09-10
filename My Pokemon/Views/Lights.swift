//
//  Lights.swift
//  My Pokemon
//
//  Created by Isay Damar Balderas Salomón on 07/09/23.
//

import SwiftUI

struct Lights: View{
    var body: some View{
        HStack{
            Circle()
                .strokeBorder(Color.white,lineWidth: 5)
                .background(Circle().foregroundColor(Color.blue))
                .frame(width: 80, height: 80)
            Circle()
                .fill(.blue)
                .frame(width: 30, height:30)
            Circle()
                .fill(.yellow)
                .frame(width: 30, height: 30)
            Circle()
                .fill(.green)
                .frame(width: 30, height: 30)
        }
        .padding(.leading, -120)
    }
}

struct Lights_Previews: PreviewProvider{
    static var previews: some View{
        Lights()
    }
}
