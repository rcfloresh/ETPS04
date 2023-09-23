//
//  main.swift
//  ejercicio10
//
//  Created by Roberto Flores on 21/9/23.
//

//Realizar un programa que permita ingresar el peso (en kilogramos) de piezas. El proceso termina cuando ingresamos el valor 0. Se debe informar:
//      a) Cuántas piezas tienen un peso entre 9.8 Kg. y 10.2 Kg.?, cuántas con más de 10.2 Kg.? y cuántas con menos de 9.8 Kg.?
//      b) La cantidad total de piezas procesadas.

import Foundation


print ("Si ingresa el valor de cero (0), el proceso terminará")

var finish = true
var weight:Double
var betweenNineEightNTenTwo:Int = 0
var higherTenTwo:Int = 0
var lowerNineEight:Int = 0
var cycles:Int = 0

repeat {

    print("Ingrese el peso en Kilogramos de las piezas")
    weight = Double(readLine()!)!
    
    if weight <= 0
    {
        finish = false
        cycles = cycles - 1
    }
    else if weight >= 9.8 && weight <= 10.2
    {
        betweenNineEightNTenTwo = betweenNineEightNTenTwo + 1
    } 
    else if weight >= 10.2
    {
        higherTenTwo = higherTenTwo + 1
    }
    else if weight <= 9.8
    {
        lowerNineEight = lowerNineEight + 1
    }
    cycles = cycles + 1
    
    
}while (finish == true)

print("La cantidad piezas entre 9.8Kg y 10.2Kg son: \(betweenNineEightNTenTwo)")
print("La cantidad de piezas menores a 9.8 son: \(lowerNineEight)")
print("La cantidad de piezas mayores a 10.2 son: \(higherTenTwo)")
print("La cantidad de piezas procesadas fueron: \(cycles)")
