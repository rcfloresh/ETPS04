//
//  main.swift
//  ejercicio09
//
//  Created by Roberto Flores on 18/9/23.
//

//En un banco se procesan datos de las cuentas corrientes de sus clientes. De cada cuenta corriente se conoce: número de cuenta y saldo actual. El ingreso de datos debe finalizar al ingresar un valor negativo en el número de cuenta.
//Se pide confeccionar un programa que lea los datos de las cuentas corrientes e informe: a)De cada cuenta: número de cuenta y estado de la cuenta según su saldo, sabiendo que:
//Estado de la cuenta 'Acreedor’
//si el saldo es >0. 'Deudor’
//si el saldo es <0. 'Nulo’
//si el saldo es =0.

import Foundation


struct CuentaCorriente {
    var numeroCuenta: Int
    var saldo: Double
}

func estadoCuenta(saldo: Double) -> String {
    if saldo > 0 {
        return "Acreedor"
    } else if saldo < 0 {
        return "Deudor"
    } else {
        return "Nulo"
    }
}

func procesarCuentasCorrientes() {
    var cuentasCorrientes: [CuentaCorriente] = []

    while true {
        print("Ingrese el número de cuenta (o un valor negativo para salir):")
        if let numeroCuenta = Int(readLine() ?? ""), numeroCuenta >= 0 {
            print("Ingrese el saldo actual:")
            if let saldo = Double(readLine() ?? "") {
                let cuenta = CuentaCorriente(numeroCuenta: numeroCuenta, saldo: saldo)
                cuentasCorrientes.append(cuenta)
            } else {
                print("Entrada inválida. Intente nuevamente.")
            }
        } else {
            break
        }
    }

    // Informar el estado de cada cuenta
    print("\nEstado de las cuentas corrientes:")
    for cuenta in cuentasCorrientes {
        let estado = estadoCuenta(saldo: cuenta.saldo)
        print("Número de cuenta: \(cuenta.numeroCuenta), Estado de la cuenta: \(estado)")
    }
}

procesarCuentasCorrientes()
