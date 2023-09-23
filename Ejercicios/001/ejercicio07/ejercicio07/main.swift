//
//  main.swift
//  ejercicio07
//
//  Created by Roberto Flores on 18/9/23.
//

// En una empresa trabajan n empleados cuyos sueldos oscilan entre $100 y $500,
// realizar un programa que lea los sueldos que cobra cada empleado e informe
// cuántos empleados cobran entre $100 y $300 y cuántos cobran más de $300.
// Además el programa deberá informar el importe que gasta la empresa en
// sueldos al personal.

import Foundation

let employees : Int
var salary : Double
var totalSalary : Double = 0

// range1, los rangos de salario entre 100 y 300
var range1 = 0

// range2, los rangos de salarios mas de 300
var range2 = 0

print("Ingrese la cantidad de empleados: ")
employees = Int(readLine()!)!

for i in 1...employees{
    print("Ingrese el salario para el empleado \(i)")
    salary = Double(readLine()!)!
    
    if salary < 100 {
        print("Fuera del rango salarial")
    }
    else if salary >= 100 && salary <= 300{
        range1 = range1 + 1
    }
    else if salary > 300
    {
        range2 = range2 + 1
    }
    
    totalSalary = totalSalary + salary
}

print("\n+--------------------------+")
print("|   Resultados             |")
print("+--------------+-----------+")
print("| Empleados en |           |")
print("| rango $100 y |     \(range1)     |")
print("| $300         |           |")
print("+--------------+-----------+")
print("| Empleados    |           |")
print("| mayor a $500 |     \(range2)     |")
print("| $300         |           |")
print("+--------------+-----------+")
print("| Importe en   |           |")
print("| salarios por |   \(totalSalary)   |")
print("| mes.         |           |")
print("+--------------+-----------+")
