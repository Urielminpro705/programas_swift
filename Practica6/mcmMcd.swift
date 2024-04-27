/*
    Uriel Mata Castellanos
    29/02/2024 
    Maximo comun y minimo
    Recibe un entero y regresa dos enteros. Uno es el minimo comun multiplo y el otro el maximo comun divisor
*/
 
func mcm(a: Int, b: Int) -> Int {
    func mcd(a: Int, b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        return x
    }
    return (a * b) / mcd(a: a, b: b)
}
 
func mcd(a: Int, b: Int) -> Int {
    var x = a
    var y = b
    while y != 0 {
        let temp = y
        y = x % y
        x = temp
    }
    return x
}
 
let numero1 = 12
let numero2 = 18
 
let mcmResultado = mcm(a: numero1, b: numero2)
let mcdResultado = mcd(a: numero1, b: numero2)
 
print("El Mínimo Común Múltiplo de \(numero1) y \(numero2) es: \(mcmResultado)")
print("El Máximo Común Divisor de \(numero1) y \(numero2) es: \(mcdResultado)")