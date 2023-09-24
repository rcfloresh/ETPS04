//
//  main.swift
//  par02eje01
//
//  Created by Roberto Flores on 24/9/23.
//

//Figuras de superheroes se pide realizar una aplicacion para una empresa que vende figuras de superheroes. Para ello tendrá que modelar todos los datos relativos a estas figuras. Se pide que programe las siguientes clase: Clase superheroe, esta definirá las caracteristicas de un superheroe, sus propiedades serán.
//
//    - Nombre (nombre del superheroe)
//    - Descripcion (cadena para descubrir brevemente su aspecto)
//    - Capa (booleano que indica si el superheroe lleva o no capa)
//
//Constructores. Haga un constructor con parametros que reciba solo el nombre del superheroe. La descripcion se inicializará a vacio (cadena vacia) y la capa se inicializará al valor false (sin capa).
//
//Metodos get y set programe: Programe los metodos get y set para cada propiedad restante de la clase. Metodo aMostrar: Programe el método aMostrar de forma que devuelva una cadena con todas sus propiedades

import Foundation

class Superheroe
{
    var name: String
    var description: String
    var layer: Bool
    
    init(name: String, description: String, layer: Bool) {
        self.name = name
        self.description = description
        self.layer = layer
    }
    
    func aMostrar(){
        print("El nombre del superheroe es: \(name)")
        print("Su descripcion es: \(description)")
        print("El estado de su capa es: \(layer)")
    }
}

print("Ingresar el nombre del superheroe:")
let name:String = readLine()!
print("Ingresar la decricpion del superheroe:")
let description:String = readLine()!
print("El superheroe usa capa:")
let layer:Bool = Bool(readLine()!)!

let sheroe = (Superheroe(name: name, description: description, layer: layer))

sheroe.aMostrar()
