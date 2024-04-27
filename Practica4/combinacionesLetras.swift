//Esta funcion sirve para calcular las combinaciones posibles de las letras de la palabra y utiliza la recursividad.
func combinaciones(_ palabra: String, _ inicio: Int = 0) -> [String] {
    var resultado = [String]()
    var letras = Array(palabra)
    
    if inicio == letras.count - 1 {
        resultado.append(String(letras))
    } else {
        for i in inicio..<letras.count {
            letras.swapAt(inicio, i)
            resultado += combinaciones(String(letras), inicio + 1)
            letras.swapAt(inicio, i)
        }
    }
    
    return resultado
}

print("Ingresa una palabra")
let palabra = readLine()!
let combinacionesPosibles = combinaciones(palabra)
print("Todas las combinaciones posibles son: ")
for item in combinacionesPosibles {
    print(item)
}
