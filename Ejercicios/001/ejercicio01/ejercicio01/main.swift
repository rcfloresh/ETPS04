//
//  main.swift
//  ejercicio01
//
//  Created by Roberto Flores on 18/9/23.
//

// Ingresar el sueldo de una persona, si supera los $3000 mostrar un mensaje
// en la salida indicado que debe abonar impuestos

import Foundation

let sueldo:Double


print ("Ingrese el sueldo del empleado: ")
sueldo = Double(readLine()!)!

if sueldo > 3000{
    print("Por su salario debe de abonar impuestos")
}
