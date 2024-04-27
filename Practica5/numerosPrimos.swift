/*
    Uriel Mata Castellanos
    29/02/2024 
    Numeros primos
    Detecta numeros primos
*/
var n:Int;
 
//Funcion para detectar si el numero es primo
func esPrimo(n:Int) -> Bool{
    //Comprueba que solo se pueda dividir entre si mismo y 1 y si al dividirlo entre 2 no sale entero entonces no es primo
    if (n%n == 0 && n/1 == n && n%2 != 0 && n%3 != 0) {
        return true
    } else {
        return false
    }
}
 
print(esPrimo(n:111))