//
//  main.swift
//  ejercicio15
//
//  Created by Roberto Flores on 23/9/23.
//

import Foundation

//Crea una aplicación que nos calcule el área de un circulo, cuadrado o triangulo. Pediremos que figura queremos calcular su área y según lo introducido pedirá los valores necesarios para calcular el área. Crea un método por cada figura para calcular cada área, este devolverá un número real. Muestra el resultado por pantalla
//Aquí te mostramos que necesita cada figura: 
//    •Circulo: (radio^2)*PI
//    •Triangulo: (base * altura) / 2
//    •Cuadrado: lado * lado



func circle() -> Double
{
    
    var ratio: Double = 0
    print("Inserte el radio del circulo: ")
    ratio = Double(readLine()!)!
    let area = pow(ratio, 2) * Double.pi
    
    return area
    
}

func triangle() -> Double
{
    var base: Double = 0
    var height : Double = 0
    
    print("Inserte la base del triangulo: ")
    base = Double(readLine()!)!
    
    print("Inserte la altura del triangulo: ")
    height = Double(readLine()!)!
    let area = (base * height) / 2
    
    return area
    
}

func square()-> Double
{
    var side : Double = 0
    print("Ingrese un lado del cuadrado: ")
    side = Double(readLine()!)!
    let area = side * side
    return area
}

func main() {
    print("Seleccione la figura para calcular su área:")
    print("1. Círculo")
    print("2. Triángulo")
    print("3. Cuadrado")
    
    let option:Int = Int(readLine()!)!
    var area: Double = 0
    
    switch option {
    case 1:
        area = circle()
        print("El área del circulo es de: \(area)")
    case 2:
        area = triangle()
        print("El área del triangulo es de: \(area)")
    case 3:
        area = square()
        print("El área del cuadrado es de: \(area)")
    default:
        print("Opcion no valida")
        
    }
    
}


main()
