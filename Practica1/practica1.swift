var terminar: Bool = false
var opcion:String = ""
var alumnos: [String] = []
repeat {
    print("1) Guardar alumnos");
    print("2) Editar alumnos");
    print("3) Borrar alumnos");
    print("4) Imprimir alumnos");
    print("5) Salir\n");
    opcion = readLine()!
    switch opcion {
        case "1":
            print("\nIngrese el nombre del alumno");
            alumnos.append(readLine()!)
            break;
            
        case "2":
            print("Introduce el numero del alumno que quieres editar:")
            let indice = readLine()!;
            var i = 1;
            for _ in alumnos {
                if (String(i) == indice) {
                    print("Introduce el nuevo nombre:")
                    alumnos[i - 1] = readLine()!
                }
                i += 1;
            }
            break;
            
        case "3":
            print("Introduce el numero del alumno que quieres eliminar:")
            let indice = readLine()!;
            var i = 1;
            for alumno in alumnos {
                if (String(i) == indice) {
                    alumnos.removeAll{$0 == alumno}
                }
                i += 1;
            }
            break;
            
        case "4":
            var i = 0;
            for alumno in alumnos {
                i += 1;
                print(String(i) + ") " + alumno)
            }
            break;
            
        case "5":
            terminar = true;
            print("Adios")
            break;
            
        default: 
            print("Opcion no valida")
            break;
    }
}while(terminar != true)