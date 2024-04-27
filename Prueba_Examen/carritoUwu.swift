
// var carrera = "🏁_____🌲🚗"
// var carrera2 = "🏁_____🌲🚗"
// var carreraArray = Array(carrera)
// var carreraArray2 = Array(carrera2)
// var sigue = true

// func accion() {
//     var sig = Int(carrera.count-2)
//     if carreraArray[sig] == "_" {
//         carreraArray.remove(at: sig)
//     } else if carreraArray[sig] != "_" {
//         carreraArray.remove(at: sig + 1)
//         carreraArray[sig] = "💥"
//     } else if carreraArray[sig] == "💥"{
//         carreraArray.append("🚗")
//     } else if carreraArray[sig] == "🏁" {
//         sigue = false
//     }

//     if carreraArray2[sig] == "_" {
//         carreraArray2.remove(at: sig)
//     } else if carreraArray2[sig] != "_" {
//         carreraArray2.remove(at: sig + 1)
//         carreraArray2[sig] = "💥"
//     } else if carreraArray2[sig] == "💥"{
//         carreraArray2.append("🚗")
//     } else if carreraArray2[sig] == "🏁" {
//         sigue = false
//     }
//     print(String(carreraArray))
//     print(String(carreraArray2))
// }   

// while sigue == true {
//     accion()
// }

import Foundation
var jugador1: String = "";
var jugador2: String = "";
var carrito1: String = "";
var carrito2: String = "";
var eleccionCarro: Int;
var numAleatorio: Int = 0
let generadorNumAleatorio: SystemRandomNumberGenerator = SystemRandomNumberGenerator()

var eleccion: Int = 0;
while eleccion != 2 {
    print("\n");
    print("|----Escoga una opcion----|");
    print("|--1) Jugar carrera-------|");
    print("|--2) Salir---------------|");
    print("\n");
    eleccion = Int(readLine()!) ?? 0;

    switch eleccion {
        case 1: 
            print("\n");
            print("|---Escoga una opcion Jugador 1---|");
            print("|-1) Carro------------------------|");
            print("|-2) Taxi-------------------------|");
            print("\n");
            eleccionCarro = Int(readLine()!) ?? 1;
            if eleccionCarro == 1 {
                carrito1 = "🚗";
            } else if eleccionCarro == 2 {
                carrito1 = "🚕";
            }
            print("|---Crea el carril del jugador 1 sin agregar la bandera ni el vehiculo---|");
            jugador1 = readLine()!;

            print("\n");
            print("|---Escoga una opcion Jugador 2---|");
            print("|-1) Carro------------------------|");
            print("|-2) Taxi-------------------------|");
            print("\n");

            eleccionCarro = Int(readLine()!) ?? 1;
            if eleccionCarro == 1 {
                carrito2 = "🚗";
            } else if eleccionCarro == 2 {
                carrito2 = "🚕";
            }
            while jugador1.count != jugador2.count {
                print("\n");
                print("|---Crea el carril del jugador 2 sin agregar la bandera ni el vehiculo---|");
                jugador2 = readLine()!;
                if jugador1.count != jugador2.count {
                    print("\n");
                    print("La pista debe de ser del mismo tamaño que la del jugador 1 (\(jugador1.count) elementos)");
                }
            }
            jugador1 = "🏁\(jugador1)\(carrito1)";
            jugador2 = "🏁\(jugador2)\(carrito2)";

            while !jugador1.contains("🏁\(carrito1)") && !jugador2.contains("🏁\(carrito2)") {
                if jugador1.contains("_🚗") {
                    jugador1 = jugador1.replacingOccurrences(of: "_\(carrito1)", with: "\(carrito1)");
                } else if jugador1.contains("🌲🚗") {
                    jugador1 = jugador1.replacingOccurrences(of: "🌲\(carrito1)", with: "_💥");
                } else if jugador1.contains("💥") {
                    jugador1 = jugador1.replacingOccurrences(of: "💥", with: "\(carrito1)");
                }

                if jugador2.contains("_\(carrito2)") {
                    jugador2 = jugador2.replacingOccurrences(of: "_\(carrito2)", with: "\(carrito2)");
                } else if jugador2.contains("🌲\(carrito2)") {
                    jugador2 = jugador2.replacingOccurrences(of: "🌲\(carrito2)", with: "_💥");
                } else if jugador2.contains("💥") {
                    jugador2 = jugador2.replacingOccurrences(of: "💥", with: "\(carrito2)");
                }

                print(String(repeating: "\n", count: 100));
                print(jugador1);
                print(jugador2);
                sleep(1);
            }

            if jugador1.count > jugador2.count {
                print("\n");
                print("|--------------------------|");
                print("|--Gana el primer jugador--|");
                print("|--------------------------|");
            } else if jugador1.count < jugador2.count{
                print("\n")
                print("|---------------------------|");
                print("|--Gana el segundo jugador--|");
                print("|---------------------------|");
            } else if jugador1.count == jugador2.count {
                print("\n");
                print("|----------------|");
                print("|--Es un empate--|");
                print("|----------------|");
            }
            break;

        case 2:
            print("|----Adios----|");
            break;

        default:
            print("No es una opcion valida")
            break;
}
}


