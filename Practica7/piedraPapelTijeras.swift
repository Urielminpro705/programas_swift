/*
    Uriel Mata Castellanos
    29/02/2024 
    Piedra, Papel o Tijera
    Crear un juego de piedra papel o tijeras
*/
 
var jugadas = [["✌️","📃"],["🪨","✌️"],["🪨","📃"]]
var j1 = 0
var j2 = 0
 
//En esta funcion se comprueba cada posible resultado de la partida y en base a eso se compara que jugador reunio mas victorias y se retorna un mensaje sobre quien gano
func aJugarUwu() -> String {
    for item: [String] in jugadas {
        if item[0] == "✌️" && item[1] == "📃" {
            j2 += 1
        } else if item[0] == "📃" && item[1] == "✌️" {
            j1 += 1
        } else if item[0] == "🪨" && item[1] == "✌️" {
            j1 += 1
        } else if item[0] == "✌️" && item[1] == "🪨" {
            j2 += 1
        } else if item[0] == "📃" && item[1] == "🪨" {
            j1 += 1
        } else if item[0] == "🪨" && item[1] == "📃" {
            j2 += 1
        }
    }
    if j1 > j2 {
        return "El ganador es el jugador 1"
    } else if j1 < j2 {
        return "El ganador es el jugador 2"
    } else {
        return "Empateeeeeeeee UWU"
    }
}
 
 
print(aJugarUwu())