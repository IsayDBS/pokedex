//
//  Top.swift
//  My Pokemon
//
//  Created by Isay Damar Balderas Salomón on 08/09/23.
//

import SwiftUI

struct Top: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + 50, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + 100, y: rect.midY - 50))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY - 50))
        
        return path
    }
}
