/*
    Uriel Mata Castellanos
    07/03/2024
    Examen
    Batalla naval
*/
var opcion: Int = 0;
var ataque: String = "";
var posicionNum: Int = 0;
var esBot = false;
var barcosRestantesBot = 3;
var barcosRestantesJu = 3;
var tableroJugador: [String] = [
    "🌊 🌊 ⛵",
    "⛵ 🌊 ⛵",
    "🌊 🌊 🌊"
]

var tableroBot: [String] = [
    "🌊 🌊 ⛵",
    "⛵ 🌊 ⛵",
    "🌊 🌊 🌊"
]

var tableroFalso: [String] = [
    "🌊 🌊 🌊",
    "🌊 🌊 🌊",
    "🌊 🌊 🌊"
]

func jugadas(tablero: inout [String], jugada: String){
    posicionNum = Int(String(jugada.last!)) ?? 0;
    var i = 0;
    if jugada.contains("A") {
        var indice = tablero[0].index(tablero[0].startIndex, offsetBy: posicionNum, limitedBy: tablero[0].endIndex)!;
        var objeto = tablero[0][indice];
        if objeto == "🌊" {
            tablero[0].replaceSubrange(indice...indice, with: "📍");
            if esBot == true {
                tableroFalso[0].replaceSubrange(indice...indice, with: "📍");
            }
        } else  if objeto == "⛵"{
            tablero[0].replaceSubrange(indice...indice, with: "💥");
            if esBot == true {
                tableroFalso[0].replaceSubrange(indice...indice, with: "💥");
            }
        }
    } else if jugada.contains("B") {
        var indice = tablero[1].index(tablero[1].startIndex, offsetBy: posicionNum, limitedBy: tablero[1].endIndex)!;
        var objeto = tablero[1][indice];
            if objeto == "🌊" {
                tablero[1].replaceSubrange(indice...indice, with: "📍");
                if esBot == true {
                    tableroFalso[1].replaceSubrange(indice...indice, with: "📍");
                }
            } else  if objeto == "⛵"{
                tablero[1].replaceSubrange(indice...indice, with: "💥");
                if esBot == true {
                    tableroFalso[1].replaceSubrange(indice...indice, with: "💥");
                }
            }
    } else if jugada.contains("C") {
        var indice = tablero[2].index(tablero[2].startIndex, offsetBy: posicionNum, limitedBy: tablero[2].endIndex)!;
        var objeto = tablero[2][indice];
        if objeto == "🌊" {
            tablero[2].replaceSubrange(indice...indice, with: "📍");
            if esBot == true {
                tableroFalso[2].replaceSubrange(indice...indice, with: "📍");
            }
        } else  if objeto == "⛵"{
            tablero[2].replaceSubrange(indice...indice, with: "💥");
            if esBot == true {
                tableroFalso[2].replaceSubrange(indice...indice, with: "💥");
            }
        }
    }
}


func barcosRestantes(tablero: [String]) -> Int {
    var count = 0
    for fila in tablero {
        for espacio in fila {
            if espacio == "⛵" {
                count += 1
            }
        }
    }
    return count
}

while opcion != 2 {
    print("\n")
    print("|---Escoge una opcion---|");
    print("|--1) Jugar-------------|");
    print("|--2) Salir-------------|");
    print("\n")
    opcion = Int(readLine()!) ?? 0;

    switch opcion {
        case 1:
            while barcosRestantesBot != 0 && barcosRestantesJu != 0 {
                    print("|---Tu Tablero---|");
                    print("   1  2  3")
                    print("A \(tableroJugador[0])")
                    print("B \(tableroJugador[1])")
                    print("C \(tableroJugador[2])")
                    print("\n")
                    print("|--Tablero enemigo--|");
                    print("   1  2  3")
                    print("A \(tableroBot[0])")
                    print("B \(tableroBot[1])")
                    print("C \(tableroBot[2])")
                if esBot == false {
                    print("\n");
                    print("|--Introduce las coordenadas a atacar (ejemplo: A1)");
                    ataque = readLine()!;
                    jugadas(tablero: &tableroBot, jugada: ataque);
                    esBot = true;
                } else {
                    var filaRandom: Int = Int.random(in: 0...2);
                    var colRandom: Int = Int.random(in: 0...2);
                    ataque = String(filaRandom) + String(colRandom);
                    jugadas(tablero: &tableroJugador, jugada: ataque);
                    esBot = false; 
                }
                barcosRestantesBot = barcosRestantes(tablero: tableroBot)
                barcosRestantesJu = barcosRestantes(tablero: tableroJugador)
            }
            
            break;

        default:
            print("XD");
            break;
    }
}