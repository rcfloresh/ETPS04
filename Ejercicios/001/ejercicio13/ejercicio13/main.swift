//
//  main.swift
//  ejercicio13
//
//  Created by Roberto Flores on 23/9/23.
//

import Foundation

//Desarrollar una programa que represente un Cuadrado y tenga los siguientes métodos: cargar el valor de su lado, imprimir su perímetro y su superficie.

var side: Double = 0

func main (){
    print("Ingrese la longitud de un lado del cuadrado: ")
    side = Double(readLine()!)!
}

func perimeter () -> Double{
    return 4 * side
}

func surface () -> Double{
    return side * side
}

func printData(){
    let perimeter = perimeter()
    let surface = surface()
    
    print("Cuadrado con lado \(side):")
    print("Perímetro: \(perimeter)")
    print("Superficie: \(surface)")
}

main()
printData()
