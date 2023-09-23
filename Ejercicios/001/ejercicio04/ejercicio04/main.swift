//
//  main.swift
//  ejercicio04
//
//  Created by Roberto Flores on 18/9/23.
//

// Realizar un programa que declarado dos números, si el primero es
// mayor que el segundo informar su suma y diferencia, en caso contrario
// informar el producto y la division del primero respecto al segundo.

import Foundation


let num1:Double
let num2:Double

print("Ingrese el primer valor:")
num1 = Double(readLine()!)!

print("Ingrese el segundo valor:")
num2 = Double(readLine()!)!

if num1 > num2 {
    let resta = num1 - num2
    let suma = num1 + num2
    print("La suma de los valores ingresados es \(suma)")
    print("La resta de los valores ingresados es \(resta)")
}
else
{
    let multiplicacion = num2 * num1
    let division = num2 / num1
    print("La multiplicacion de los valores ingresados es \(multiplicacion)")
    print("La división de los valores ingresados es \(division)")
}
