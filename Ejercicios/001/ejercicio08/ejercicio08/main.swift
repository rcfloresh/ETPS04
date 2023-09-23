//
//  main.swift
//  ejercicio08
//
//  Created by Roberto Flores on 18/9/23.
//

// Una planta que fabrica perfiles de hierro posee un lote de n piezas.
// Confeccionar un programa que pida ingresar por teclado la cantidad de piezas a
// procesar y luego ingrese la longitud de cada perfil; sabiendo que la pieza cuya
// longitud esté comprendida en el rango de 1,20 y 1,30 son aptas. Imprimir por
// pantalla la cantidad de piezas aptas que hay en el lote

import Foundation

let qPiecesRequired : Int
let qPiecesBuild : Int
var pieceSize : Double = 0
var pieceAllowed : Int = 0

print("Ingresar la cantidad de piezas a procesar")
qPiecesBuild = Int(readLine()!)!

var I:Int = 0
while (I < qPiecesBuild)
{
    print("Ingrese la longitud de la pieza")
    pieceSize = Double(readLine()!)!
    
    if pieceSize >= 1.20 && pieceSize <= 1.30
    {
        pieceAllowed = pieceAllowed + 1
    }
    
    I = I + 1
}

print("\nTotal de piezas aptas para construir \(pieceAllowed)")
