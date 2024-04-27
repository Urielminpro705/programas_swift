/*
    Uriel Mata Castellanos
    76907
    20/03/2024
    Crear un buscaminas
*/

import Foundation

func crearTablero() -> [[Int]]{
    var tablero:[[Int]] = []
    for _ in 0..<tamaño {
        var fila: [Int] = [];
        for _ in 0..<tamaño {
            fila.append(-2)
        }
        tablero.append(fila)
    }
    return tablero
}

func ponerMinas() {
    var i: Int = 0;
    while i < tamaño {
        let filaRandom: Int = Int.random(in: 0..<tamaño);
        let columnaRandom: Int = Int.random(in: 0..<tamaño);

        if tablero[filaRandom][columnaRandom] != -1 {
            tablero[filaRandom][columnaRandom] = -1
            i += 1;
        }
    }
}

func mostrarTablero() {
    print(String(repeating: "\n", count: 100));
    let emojisNumeros: [String] = ["1️⃣ ","2️⃣ ","3️⃣ ","4️⃣ ","5️⃣ ","6️⃣ ","7️⃣ ","8️⃣ ","9️⃣ ","🔟 "];
    var numerosNecesarios: String = "   ";
    for n: Int in 0..<tamaño {
        numerosNecesarios += emojisNumeros[n];
    }
    print(numerosNecesarios);
    if yaPerdio == false {
        for f: Int in 0..<tamaño {
            var filaVisible: String = emojisNumeros[f] + " ";
            for c: Int in 0..<tamaño {
                if tablero[f][c] == -2 || tablero[f][c] == -1 {
                    filaVisible += "⬜";
                } else {
                    filaVisible += " " + String(tablero[f][c]);
                }
            }
            print(filaVisible);
        }
    } else {
        for f: Int in 0..<tamaño {
            var filaVisible: String = emojisNumeros[f] + " ";
            for c: Int in 0..<tamaño {
                if tablero[f][c] == -2{
                    filaVisible += "⬜";
                } else  if tablero[f][c] == -1 {
                    filaVisible += "💣";
                } else {
                    filaVisible += String(tablero[f][c]) + " ";
                }
            }
            print(filaVisible);
        }
    }
    
}

func detectarBombas(fila: Int, columna: Int) {
    if tablero[fila][columna] == -1 {
        yaPerdio = true;
        mostrarTablero();
        print("\n|--- Perdiste :( ---|");
    } else if tablero[fila][columna] == 0 {

    } else {
        var f: Int = (fila == 0 || fila == (tamaño-1)) ? 1 : 0;
        var c: Int = (columna == 0 || columna == (tamaño-1)) ? 1 : 0;    

        var filaInicial: Int;
        var columnaInicial: Int;
        var contador: Int = 0;
        if fila == 0 {
            filaInicial = fila;
        } else {
            filaInicial = fila - 1;
        }
        if columna == 0 {
            columnaInicial = columna
        } else {
            columnaInicial = columna - 1;
        }

        let auxFila: Int = filaInicial;
        let auxColumna: Int = columnaInicial;
        let auxC: Int = c
        let auxF: Int = f
        while f < 3 {
            while c < 3 {
                if tablero[filaInicial][columnaInicial] == -1 {
                    contador += 1;
                }
                columnaInicial += 1;
                c += 1;
            }
            columnaInicial = auxColumna;
            c = auxC;
            filaInicial += 1;
            f += 1;
        }

        f = auxF
        tablero[fila][columna] = contador;
        if contador == 0 {
            filaInicial = auxFila;
            columnaInicial = auxColumna;
            while f < 3 {
                c = (columna == 0 || columna == (tamaño-1)) ? 1 : 0;  
                while c < 3 {
                    detectarBombas(fila: filaInicial, columna: columnaInicial);
                    c += 1;
                    columnaInicial += 1;
                }
                if columna == 0 {
                    columnaInicial = columna
                } else {
                    columnaInicial = columna - 1;
                }
                f += 1;
                filaInicial += 1;
            }
        }
    }

}

func seContinua() -> Bool{
    for f: Int in 0..<tamaño {
        for c: Int in 0..<tamaño {
            if tablero[f][c] == -2 {
                return false;
            }
        }
    }
    return true;
}



var tablero: [[Int]];
var tamaño: Int;
var opcion: String = "";
var coordenadasTxt: String;
var coordenadas: [String.SubSequence];
var fila: Int;
var columna: Int;
var yaPerdio: Bool = false;
var seTermino: Bool = false;

while opcion != "2" {
    yaPerdio = false;
    print("\n|------BUSCAMINAS------|");
    print("|---Elige una opcion---|");
    print("|--1) Jugar------------|");
    print("|--2) Salir------------|");
    print("|----------------------|");
    opcion = readLine()!;
    switch opcion {
        case "1": 
            print("\n|---Introduce el tamaño del tablero---|");
            tamaño = Int(readLine()!) ?? 5;
            tablero = crearTablero();
            ponerMinas();
            repeat {
                mostrarTablero();
                print("\n|--Introduce las coordenadas (Primero fila y luego columna con formato 2-1)--|");
                coordenadasTxt = readLine()!;
                coordenadas = coordenadasTxt.split(separator: "-");
                fila = Int(coordenadas[0]) ?? 0;
                columna = Int(coordenadas[1]) ?? 0;
                fila -= 1;
                columna -= 1;
                detectarBombas(fila: fila, columna: columna);
                seTermino = seContinua();
                if seTermino == true{
                    print("\n|-----GANASTE-----|")
                }
            } while yaPerdio == false && seTermino == false;
            break;
        case "2": 
            print("|---Hasta luego---|")
            break;
        default:
            print("|--Opcion no valida--|")
            break;
    }
}