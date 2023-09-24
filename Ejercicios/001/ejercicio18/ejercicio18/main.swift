//
//  main.swift
//  ejercicio18
//
//  Created by Roberto Flores on 24/9/23.
//

import Foundation

//Crear una clase que represente un empleado. Definir como atributos su nombre y su sueldo. En el constructor cargar los atributos y luego en otro método imprimir sus datos y por último uno que imprima un mensaje si debe pagar impuestos (si el sueldo supera a $3000).


class Empleado {
    var name: String
    var income: Double
    
    init(name: String, income: Double) {
        self.name = name
        self.income = income
    }
    
    func imprimirDatos() {
        print("Nombre del empleado: \(name)")
        print("Sueldo del empleado: $\(income)")
    }
    
    func pagarImpuestos() {
        if income > 3000 {
            print("\(name) debe pagar impuestos.")
        } else {
            print("\(name) no debe pagar impuestos.")
        }
    }
}


print("Ingrese el nombre del empleado: ")
let name:String = readLine()!

print("El sueldo del empleado: ")
let income:Double = Double(readLine()!)!
let employee = Empleado(name: name, income: income)

employee.imprimirDatos()
employee.pagarImpuestos()
