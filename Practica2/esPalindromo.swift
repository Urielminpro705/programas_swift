/*
	Uriel Mata Castellanos
	27/02/2024
	esPalindromo
	Una funcion a la que le paso un string y regresa si es un palindromo o no
*/

// Tambien se puede poner asi Array<Character> en lugar de [Character]

func esPalindromo(_ palabraUwu:String) -> Bool {
    let letras: Array = Array(palabraUwu);
    
    if (letras == letras.reversed()) {
        return true
    } else {
        return false
    }
}

print(esPalindromo("lolo"));
