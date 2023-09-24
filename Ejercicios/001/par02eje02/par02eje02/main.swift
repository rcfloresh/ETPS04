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
