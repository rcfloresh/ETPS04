//
//  main.swift
//  ejercicio03
//
//  Created by Roberto Flores on 18/9/23.
//

// Realizar un programa que solicite declarar dos números distintos
// y muestre por pantalla el mayor de ellos


import Foundation

let num1:Double
let num2:Double

print("Calculo de mayores\n\n")
print("Ingrese el primer numero:")
num1 = Double(readLine()!)!

print("Ingrese el segundo numero:")
num2 = Double(readLine()!)!

if (num1 > num2)
{
    print("El primer numero es mayor que el segundo.")
}
else{
    print("El segundo numero es mayor que le primero")
}
