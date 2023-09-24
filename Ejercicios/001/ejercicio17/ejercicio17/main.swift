//
//  main.swift
//  ejercicio17
//
//  Created by Roberto Flores on 24/9/23.
//

import Foundation

//Crear una clase TablaMultiplicar. Definir dos constructores uno con un parámetro que llegue un entero indicando que tabla queremos ver y otro con dos enteros que indique el primero que tabla queremos ver y el segundo parámetro indica cuantos términos mostrar.
//Si no llega la cantidad de términos a mostrar inicializar en 10 los términos a mostrar


class TablaMultiplicar {
    var tableNumber: Int
    var termsQuantity: Int
    
    init(tableNumber: Int) {
        self.tableNumber = tableNumber
        self.termsQuantity = 10
    }
    
    init(tableNumber: Int, termsQuantity: Int) {
        self.tableNumber = tableNumber
        self.termsQuantity = termsQuantity > 0 ? termsQuantity : 10
    }
    
    func mostrarTabla() {
        print("Tabla de multiplicar del \(tableNumber) con \(termsQuantity) términos:")
        for i in 1...termsQuantity {
            let resultado = tableNumber * i
            print("\(tableNumber) x \(i) = \(resultado)")
        }
    }
}

print("Insertar el numero de la tabla: ")
let tableNumber:Int = Int(readLine()!)!


print("Insertar la cantidad de terminos: ")
let termsQuantity:Int = Int(readLine()!)!

let table1 = TablaMultiplicar(tableNumber: tableNumber)
let table2 = TablaMultiplicar(tableNumber: tableNumber, termsQuantity: termsQuantity)

table1.mostrarTabla()
table2.mostrarTabla()

