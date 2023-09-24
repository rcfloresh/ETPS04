//
//  main.swift
//  ejercicio12
//
//  Created by Roberto Flores on 23/9/23.
//

import Foundation

// Desarrollar un programa que cargue los lados de un triángulo e implemente los siguientes métodos: inicializar los atributos, imprimir el valor del lado mayor y otro método que muestre si es equilátero o no.

var ladoA:Double = 0
var ladoB:Double = 0
var ladoC:Double = 0

func main(){
    print("Introducir los valores del lado A: ")
    ladoA = Double(readLine()!)!
    print("Introducir los valores del lado B: ")
    ladoB = Double(readLine()!)!
    print("Introducir los valores del lado C: ")
    ladoC = Double(readLine()!)!
}

func major(){
    let major = max(ladoA, max(ladoB, ladoC))
    print ("El lado mayor longitud posee: \(major)")
}

func esEquilatero() -> Bool {
        return ladoA == ladoB && ladoB == ladoC
}

func mostrarEquilatero() {
        if esEquilatero() {
            print("El triángulo es equilátero.")
        } else {
            print("El triángulo no es equilátero.")
        }
    }

main()
major()
mostrarEquilatero()
