//
//  main.swift
//  ejercicio14
//
//  Created by Roberto Flores on 23/9/23.
//

import Foundation

//Crear un metodo que permita ingresar tres valores por teclado. Luego mostrar el mayor y el menor.

var valueA: Double = 0
var valueB: Double = 0
var valueC: Double = 0

func main(){
    print("Ingresar el valor A: ")
    valueA = Double(readLine()!)!
    
    print("Ingresar el valor B: ")
    valueB = Double(readLine()!)!
    
    print("Ingresar el valor C: ")
    valueC = Double(readLine()!)!
}

func major (valueA: Double, valueB: Double, valueC : Double) -> Double{
    let major = max(valueA, max(valueB, valueC))
    return major
}

func minior (valueA: Double, valueB: Double, valueC : Double) -> Double{
    let minior = min(valueA, min(valueB, valueC))
    return minior
}

func printResults (){
    let major = major(valueA : valueA, valueB : valueB, valueC : valueC)
    let minior = minior(valueA : valueA, valueB : valueB, valueC : valueC)
    
    print("El numero mayor es: \(major)")
    print("El numero menor es: \(minior)")
}


main()
printResults()
