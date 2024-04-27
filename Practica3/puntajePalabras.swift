enum Letras: Int {
    case a = 1, b, c, d, e, f, g, h, i, j, k, l, m, n, ñ, o, p, q, r, s, t, u, v, w, x, y, z
}

let puntuaciones: [Character: Int] = [
    "a": Letras.a.rawValue, "b": Letras.b.rawValue, "c": Letras.c.rawValue, "d": Letras.d.rawValue,
    "e": Letras.e.rawValue, "f": Letras.f.rawValue, "g": Letras.g.rawValue, "h": Letras.h.rawValue,
    "i": Letras.i.rawValue, "j": Letras.j.rawValue, "k": Letras.k.rawValue, "l": Letras.l.rawValue,
    "m": Letras.m.rawValue, "n": Letras.n.rawValue, "ñ": Letras.ñ.rawValue, "o": Letras.o.rawValue,
    "p": Letras.p.rawValue, "q": Letras.q.rawValue, "r": Letras.r.rawValue, "s": Letras.s.rawValue,
    "t": Letras.t.rawValue, "u": Letras.u.rawValue, "v": Letras.v.rawValue, "w": Letras.w.rawValue,
    "x": Letras.x.rawValue, "y": Letras.y.rawValue, "z": Letras.z.rawValue
]

func puntajePalabra(_ palabra: String) -> Int {
    var puntaje = 0
    for letra in palabra.lowercased() {
        if let valor = puntuaciones[letra] {
            puntaje += valor
        }
    }
    return puntaje
}

var palabra = ""
var puntaje = 0

repeat {
    print("Ingresa una palabra:")
    if let input = readLine() {
        palabra = input
        puntaje = puntajePalabra(palabra)
        
        if puntaje > 100 {
            print("El puntaje de la palabra '\(palabra)' es mayor que 100. Por favor, intenta nuevamente.")
        } else if puntaje < 100 {
            print("El puntaje de la palabra '\(palabra)' es menor que 100. Por favor, intenta nuevamente.")
        }
    }
} while puntaje > 100 || puntaje < 100


// enum letras:Int {
//     case a = 1
//     case b = 2
//     case c = 3
//     case d = 4
//     case e = 5
//     case f = 6
//     case g = 7
//     case h = 8
//     case i = 9
//     case j = 10
//     case k = 11
//     case l = 12
//     case m = 13
//     case n = 14
//     case ñ = 15
//     case o = 16
//     case p = 17
//     case q = 18
//     case r = 19
//     case s = 20
//     case t = 21
//     case u = 22
//     case v = 23
//     case w = 24
//     case x = 25
//     case y = 26
//     case z = 27
// }

// func puntajePalabra(_ palabra: String) -> Int {
//         var puntaje = 0
//         for letra in palabra.lowercased() {
//             if let valor = letras[letra] {
//                 puntaje += valor
//             }
//         }
//         return puntaje
//     }
    
// var palabra = ""
// var puntaje = 0

// repeat {
//     print("Ingresa una palabra:")
//     if let input = readLine() {
//         palabra = input
//         puntaje = letras.puntajePalabra(palabra)
        
//         if puntaje > 100 {
//             print("El puntaje de la palabra '\(palabra)' es mayor que 100. Por favor, intenta nuevamente.")
//         } else if puntaje < 100 {
//             print("El puntaje de la palabra '\(palabra)' es menor que 100. Por favor, intenta nuevamente.")
//         }
//     }
// } while puntaje > 100 || puntaje < 100
