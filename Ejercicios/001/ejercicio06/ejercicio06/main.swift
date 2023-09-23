//
//  main.swift
//  ejercicio06
//
//  Created by Roberto Flores on 18/9/23.
//

// Un postulante a un empleo, realiza un test de capacitación,
// se obtuvo la siguiente información: cantidad total de
// preguntas que se le realizaron y la cantidad de preguntas que
// contestó correctamente. Se pide crear un programa que
// declare los dos datos e informe el nivel del mismo según el
// porcentaje de respuestas correctas que ha obtenido, y
// sabiendo que:
// Nivel máximo: Porcentaje>=90%.
// Nivel medio: Porcentaje>=75% y <90%.
// Nivel regular: Porcentaje>=50% y <75%.
// Fuera de nivel: Porcentaje<50%.

import Foundation

let questions:Double
let answers:Double


print("Calculo de notas de alumnos")

print("Ingrese la cantidad de pregutas realizadas: ")
questions = Double(readLine()!)!

print("Ingrese la cantidad de respuestas correctas: ")
answers = Double(readLine()!)!

let promedio =  (answers / questions) * 100

if promedio >= 90 {
    print("Maximo nivel")
}
else if promedio >= 75
{
    print("Nivel medio")
}
else if promedio >= 50
{
    print("Nivel regular")
}
else
{
    print("Fuera de nivel")
}
