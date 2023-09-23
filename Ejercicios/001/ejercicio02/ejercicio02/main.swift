//
//  main.swift
//  ejercicio02
//
//  Created by Roberto Flores on 18/9/23.
//

// Se declaran cinco notas de un alumno, si el promedio es mayor o igual
// a siete mostrar un mensaje "Aprobado ETPS4."

import Foundation

let nota1:Double
let nota2:Double
let nota3:Double
let nota4:Double
let nota5:Double
let promedio:Double

print("Calculo de notas de alumnos")

print("Ingrese las notas 1 del alumno: ")
nota1 = Double(readLine()!)!

print("Ingrese las notas 2 del alumno: ")
nota2  = Double(readLine()!)!

print("Ingrese las notas 3 del alumno: ")
nota3 = Double(readLine()!)!

print("Ingrese las notas 4 del alumno: ")
nota4 = Double(readLine()!)!

print("Ingrese las notas 5 del alumno: ")
nota5 = Double(readLine()!)!

promedio = (nota1+nota2+nota3+nota4+nota5)/5

if promedio >= 7 {
    print("Aprobado ETPS4")
}
