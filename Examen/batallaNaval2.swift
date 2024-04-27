var opcion: Int = 0
var ataque: String = ""
var posicionNum: Int = 0
var esBot = false
var barcosRestantesBot = 3
var barcosRestantesJu = 3
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

func jugada(tablero: inout [String], jugada: String) {
    let fila = jugada.prefix(1)
    let columna = Int(String(jugada.suffix(1))) ?? 0
    let filaIndex = fila == "A" ? 0 : fila == "B" ? 1 : 2

    if tablero[filaIndex][columna - 1] == "⛵" {
        tablero[filaIndex] = tablero[filaIndex].replacingOccurrences(of: "⛵", with: "💥")
    } else {
        tablero[filaIndex] = tablero[filaIndex].replacingOccurrences(of: "🌊", with: "📍", options: .regularExpression, range: nil)
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
    print("|---Escoge una opcion---|")
    print("|--1) Jugar-------------|")
    print("|--2) Salir-------------|")
    opcion = Int(readLine()!) ?? 0

    switch opcion {
    case 1:
        while barcosRestantesBot != 0 && barcosRestantesJu != 0 {
            print("|---Tu Tablero---|")
            print("   1  2  3")
            print("A \(tableroJugador[0])")
            print("B \(tableroJugador[1])")
            print("C \(tableroJugador[2])")
            print("\n")
            print("|--Tablero enemigo--|")
            print("   1  2  3")
            print("A \(tableroFalso[0])")
            print("B \(tableroFalso[1])")
            print("C \(tableroFalso[2])")

            if !esBot {
                print("\n")
                print("|--Introduce las coordenadas a atacar (ejemplo: A1)")
                ataque = readLine()!
                jugada(tablero: &tableroBot, jugada: ataque)
                esBot = true
            } else {
                let filaRandom = ["A", "B", "C"].randomElement() ?? "A"
                let columnaRandom = Int.random(in: 1...3)
                ataque = filaRandom + String(columnaRandom)
                jugada(tablero: &tableroJugador, jugada: ataque)
                esBot = false
            }
            barcosRestantesBot = barcosRestantes(tablero: tableroBot)
            barcosRestantesJu = barcosRestantes(tablero: tableroJugador)
        }

        break

    default:
        print("XD")
        break
    }
}
