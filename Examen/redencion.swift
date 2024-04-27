var tableroJugador = ["🌊🌊🌊","⛵🌊⛵", "🌊⛵🌊"]
var tableroBot = ["🌊🌊🌊","⛵🌊⛵", "🌊⛵🌊"]
var tableroAnon = ["🌊🌊🌊","🌊🌊🌊", "🌊🌊🌊"]
var juegaJugador = true
var ganador = "";

func alguienGana() -> String{
    var x: String;
    for item in tableroBot {
        if item.contains("⛵") {
            for item in tableroJugador {
                if item.contains("⛵") {
                    x = ""
                    return x
                }
            }
            x = "|--Gana el Bot--|"
            return x
        }
    }
    x = "|--Gana el jugador--|"
    return x
}

var i = 3;
    print("\n")
    print("|--Tu tablero--|")
    print("   1 2 3")
    print("A \(tableroJugador[0])")
    print("B \(tableroJugador[1])")
    print("C \(tableroJugador[2])")
    print("\n")
    
    print("|--Tablero del bot--|")
    print("   1 2 3")
    print("A \(tableroAnon[0])")
    print("B \(tableroAnon[1])")
    print("C \(tableroAnon[2])")
    print("\n")
while ganador == "" {
    if juegaJugador == true {
        print("|--Ingresa las coordenadas de tu ataque en fotmato (A 1)--|")
        var ataque = readLine()!;
        var cord = ataque.split(separator: " ")
        var cordFila = 0;
        print(cord)
        if String(cord[0]) == "A" {
            cordFila = 0
        } else if String(cord[0]) == "B" {
            cordFila = 1
        } else if String(cord[0]) == "C" {
            cordFila = 2
        }
        var fila = tableroBot[cordFila]
        var elementos = Array(fila)
        var filaAnon = tableroAnon[cordFila]
        var elementosAnon = Array(filaAnon)
        if elementos[(Int(String(cord[1])) ?? 0) - 1] == "🌊" {
            elementos[(Int(String(cord[1])) ?? 0) - 1] = "📍" 
            elementosAnon[(Int(String(cord[1])) ?? 0) - 1] = "📍" 
        } else if elementos[(Int(String(cord[1])) ?? 0) - 1] == "⛵" {
            elementos[(Int(String(cord[1])) ?? 0) - 1] = "💥"
            elementosAnon[(Int(String(cord[1])) ?? 0) - 1] = "💥"
        }

        tableroBot[cordFila] = String(elementos)
        tableroAnon[cordFila] = String(elementosAnon)
        juegaJugador = false
        ganador = alguienGana()
    } else if juegaJugador == false {
        var fila = Int.random(in: 0...2) 
        var col = Int.random(in: 0...2)
        var cord = [fila, col] 
        var cadena = tableroJugador[fila]
        var elementos = Array(cadena)
        if elementos[cord[1]] == "🌊" {
            elementos[cord[1]] = "📍" 
        } else if elementos[cord[1]] == "⛵" {
            elementos[cord[1]] = "💥"
        }
        tableroJugador[fila] = String(elementos)
        ganador = alguienGana()
        juegaJugador = true
    }
    print(String(repeating: "\n", count: 100))
    print("|--Tu tablero--|")
    print("   1 2 3")
    print("A \(tableroJugador[0])")
    print("B \(tableroJugador[1])")
    print("C \(tableroJugador[2])")
    print("\n")
    
    print("|--Tablero del bot--|")
    print("   1 2 3")
    print("A \(tableroAnon[0])")
    print("B \(tableroAnon[1])")
    print("C \(tableroAnon[2])")
    print("\n")
}

print(ganador)