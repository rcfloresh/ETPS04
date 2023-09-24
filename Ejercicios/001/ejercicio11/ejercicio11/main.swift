//
//  main.swift
//  ejercicio11
//
//  Created by Roberto Flores on 23/9/23.
//

//  Desarrollar un programa que represente un punto en el plano y tenga los siguientes métodos: cargar los valores de x e y, imprimir en que cuadrante se encuentra dicho punto (concepto matemático, primer cuadrante si x e y son positivas, si x<0 e y>0 segundo cuadrante, etc.)

import Foundation

var xValue:Double = 0
var yValue:Double = 0

func checkQ ()
{
    if xValue >= 0 && yValue >= 0 {
        print("Los valores pertenecen al primer cuadrante")
    }
    else if xValue < 0 && yValue >= 0 {
        print("Los valores pertenecen al segundo cuadrante")
    }
    else if xValue < 0 && yValue < 0 {
        print("Los valores pertenecen al tercer cuadrante")
    }
    else
    {
        print("Los valores pertenecen al cuarto cuadrante")
    }
    
}

func main(){
    print("Ingrese el valor de X: ")
    xValue = Double(readLine()!)!
    print("Ingrese el valor de Y: ")
    yValue = Double(readLine()!)!
}
    

main()
checkQ()
