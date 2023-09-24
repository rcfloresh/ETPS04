//
//  main.swift
//  ejercicio16
//
//  Created by Roberto Flores on 23/9/23.
//

import Foundation

//Crear una clase llamada Alumno y definir como atributos su nombre y su edad. En el constructor realizara la carga de datos. Definir otros dos métodos para imprimir los datos ingresados y un mensaje si es mayor o no de edad (edad >=18)


class Alumno {
    var name: String
    var age: Int
    
    init(name: String, age: Int) 
    {
        self.name = name
        self.age = age
    }
    
    func imprimirDatos()
    {
            print("Nombre del alumno: \(name)")
            print("Edad del alumno: \(age) años")
    }
    
    func esMayorDeEdad() 
    {
            if age >= 18 {
                print("\(name) es mayor de edad.")
            } else {
                print("\(name) no es mayor de edad.")
            }
    }
}


print("Inserte el nombre del alumno: ")
let alumnoName = readLine()!

print("Inserte la edad del alumno: ")
let alumnoAge:Int = Int(readLine()!)!

let alumno1 = Alumno(name: alumnoName, age: alumnoAge)

alumno1.imprimirDatos()
alumno1.esMayorDeEdad()
