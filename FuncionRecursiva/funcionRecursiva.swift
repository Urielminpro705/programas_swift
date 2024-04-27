func factorial(lol : Int) -> Int {
    if (lol > 1) {
        return lol * factorial(lol:(lol-1))
    } else {
        return 1;
    }
}



var vamoooo = factorial(lol:5);
print(vamoooo)

func exponencial1(x:Double, e:Int) -> Double {
    if(e == 0) {
        return 1;
    } else if(e >= 0) {
        return x*exponencial1(x:x, e:(e-1));
    } else {
        return (1/(x/exponencial1(x:x, e:(e+1))));
    }
}

print(exponencial1(x:3, e:4));
print(exponencial1(x:3, e:3));
print(exponencial1(x:3, e:-3));
print(exponencial1(x:3, e:-4));

func exponencial2(x:Double, e:Int) -> Double {
    if(e == 0) {
        return 1;
    } else if(e >= 0) {
        return x*exponencial2(x:x, e:(e-1));
    } else {
        return x/exponencial2(x:x, e:(-(e-1)));
    }
}

print(exponencial2(x:3, e:4));
print(exponencial2(x:3, e:3));
print(exponencial2(x:3, e:-3));
print(exponencial2(x:3, e:-4));

func exponencial3(x:Double, e:Int) -> Double {
    if(e == 0) {
        return 1;
    } else if(e >= 0) {
        return x*exponencial3(x:x, e:(e-1));
    } else {
        return 1/exponencial3(x:x, e:(-e));
    }
}

print(exponencial3(x:3, e:4));
print(exponencial3(x:3, e:3));
print(exponencial3(x:3, e:-3));
print(exponencial3(x:3, e:-4));
print(exponencial3(x:2, e:-3));

for indice in 1...7 {    
print("\(indice) multiplicado por 5 es \(indice * 5)")
}


var hoy = "jueves";
var nombre = hoy == "jueves" ? true : false;
print(nombre)

print(type(of: nombre))

var miTupla = (1, "Hola")
miTupla.0 = 2
print(miTupla)
var textitoUwu: String  = "1"
var textitoNumero: Int = Int(textitoUwu) ?? 0
print(textitoNumero * 4)