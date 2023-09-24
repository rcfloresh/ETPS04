//
//  main.swift
//  par02eje02
//
//  Created by Roberto Flores on 24/9/23.
//

import Foundation

//Crear una cuenta que permita crear cuentas bancarias. La clase ha de tener los siguientes requisitos:
//
//- Nombre: Parcial III
//- Tendrá las siguientes propiedades:
//    - saldoDeCuenta
//    - nombreDelTitular
//    - numeroDeCuenta
//
//- Constructor de la clase con dos parametros:
//    - nombreDelTitular
//    - saldoDeCuenta
//
//- Metodos de la clase
//    - Se crearán dos setters, uno para hacer ingresos (setIngreso) y otro para hacer retiros (setReintegro). Se crearán en un objeto de tipo Parcial.
//    - Se crearan dos getters, uno permitirá obtener el saldo (getSaldoCuenta) de la cuenta corriente y el otro obtendrá los datos generales (getDatosCuenta) de una Parcial.
//    - Se creará un método (RealizarTransferenciaEntreCuentas) para permitir realiar transferencias de dinero de una cuenta a otra cuenta (de una Parcial a otra).
//
//El constructor de la clase Parcial será el encargado de establecer:
//    - Un nombre para el titular de la cuenta corriente.
//    - Un saldo inicial para la cuenta corriente.
//    - Asignará un número de cuenta corriente tipo long, de forma aleatoria.
//
//La clase Parcial se creará en una clase principal llamada OperacionesBanco. En esta clase parcial OperacionesBanco se crearán dos instancias de la clase Parcial, con el nombre Parcial_1 y Parcial_2
//
//Para probar la correcta creación de los metodos Parcial, se realizará una transferencia desde la Parcial_1 y a la Parcial_2. Se mostrarán todos los datos de ambas cuentas Parcial_1 y Parcial_2 para comprobar como han quedado.

class Parcial {
    var saldoDeCuenta: Double
    let nombreDelTitular: String
    let numeroDeCuenta: Int64
    
    init(nombreDelTitular: String, saldoDeCuenta: Double) {
        self.nombreDelTitular = nombreDelTitular
        self.saldoDeCuenta = saldoDeCuenta
        self.numeroDeCuenta = Int64.random(in: 1000..<10000)
    }
    
    func setIngreso(cantidad: Double) {
        if cantidad > 0 {
            saldoDeCuenta += cantidad
        }
    }
    
    func setReintegro(cantidad: Double) {
        if cantidad > 0 && cantidad <= saldoDeCuenta {
            saldoDeCuenta -= cantidad
        }
    }
    
    func getSaldoCuenta() -> Double {
        return saldoDeCuenta
    }
    
    func getDatosCuenta() -> String {
        return "Nombre del Titular: \(nombreDelTitular)\nNúmero de Cuenta: \(numeroDeCuenta)\nSaldo de la Cuenta: $\(saldoDeCuenta)"
    }
    
    func realizarTransferenciaEntreCuentas(otraCuenta: Parcial, cantidad: Double) {
        if cantidad > 0 && cantidad <= saldoDeCuenta {
            saldoDeCuenta -= cantidad
            otraCuenta.setIngreso(cantidad: cantidad)
            print("Transferencia exitosa de $\(cantidad) a la cuenta de \(otraCuenta.nombreDelTitular)")
        } else {
            print("La transferencia no pudo realizarse debido a fondos insuficientes.")
        }
    }
}

class OperacionesBanco {
    var Parcial_1: Parcial
    var Parcial_2: Parcial
    
    init() {
        print("Ingrese el nombre del titular de la cuenta 1:")
        let nombreCuenta1 = readLine() ?? "Titular_1"
        print("Ingrese el saldo inicial de la cuenta 1:")
        if let saldoCuenta1 = Double(readLine() ?? "1000.0") {
            Parcial_1 = Parcial(nombreDelTitular: nombreCuenta1, saldoDeCuenta: saldoCuenta1)
        } else {
            Parcial_1 = Parcial(nombreDelTitular: nombreCuenta1, saldoDeCuenta: 1000.0)
        }
        
        print("Ingrese el nombre del titular de la cuenta 2:")
        let nombreCuenta2 = readLine() ?? "Titular_2"
        print("Ingrese el saldo inicial de la cuenta 2:")
        if let saldoCuenta2 = Double(readLine() ?? "2000.0") {
            Parcial_2 = Parcial(nombreDelTitular: nombreCuenta2, saldoDeCuenta: saldoCuenta2)
        } else {
            Parcial_2 = Parcial(nombreDelTitular: nombreCuenta2, saldoDeCuenta: 2000.0)
        }
    }
    
    func realizarTransferencia() {
        print("Ingrese la cantidad a transferir de la cuenta 1 a la cuenta 2:")
        if let cantidad = Double(readLine() ?? "0.0") {
            Parcial_1.realizarTransferenciaEntreCuentas(otraCuenta: Parcial_2, cantidad: cantidad)
        } else {
            print("Cantidad inválida.")
        }
    }
    
    func mostrarDatosCuentas() {
        print("Datos de la Cuenta 1:\n\(Parcial_1.getDatosCuenta())\n")
        print("Datos de la Cuenta 2:\n\(Parcial_2.getDatosCuenta())")
    }
}

let operacionesBanco = OperacionesBanco()
operacionesBanco.realizarTransferencia()
operacionesBanco.mostrarDatosCuentas()

