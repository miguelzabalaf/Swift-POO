import UIKit

//Struct And Class: Permiten almacenar propiedades, subindices, metodos, inicializadores (Constructores), pueden ser extendidas y mas

// Class: Se puede hablar de herencia, puedes adoptar la funcionalidad de una clase madre, casting, se puede definir un desinicializador que es lo contrario de un inicializador para liberar la memoria y evitar que el programa tenga exceso de memoria, y reference couting: para saber cuantos fragmentos de codigo estan usando una determinada variable

struct SomeStruct {
//    La definicion de la estructura aqui
//    Se utilizan preferiblemente para contenedores de datos que no se quiere que hagan demasiadas cosas
}

class SomeClass {
//    La definicion de la clase aqui
}

struct Resolution {
    var width = 0
    var height = 0
    // Stored propeties, pueden ser variables o constantes
}

class VideoMode {
    var resolution = Resolution() // Inicializa un objeto/Estructura Resolution, variable de tipo Resolution
    var interlaced =  false
    var frameRate = 0.0
    var name: String? // El nombre puede ser opcional: nil o no nil
}

let someResolution =  Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)  //0
someVideoMode.resolution.width = 1080
print(someVideoMode.resolution.width) // 1080

someVideoMode.frameRate = 30.0
print(someVideoMode.frameRate)

// Una estructura una vez creada ocupa un espacio en la memoria y cuando se declara como inmutable, a diferencia en las clases que si se podra cambiar sus valores

// Diferencia: Una estructura que habeis definido como constate no podra cambiar sus valores(Esto no cambiara su posicion en memoria)

//_____________________________________________
//
//... ESTRUCTURA, DATOS COPIADOS
//
//_____________________________________________

let vga = Resolution(width: 640, height: 480) // Estamos inicializando
vga.width //  640
vga.height // 480

let hd = Resolution(width: 1920, height: 1080)

var cinema =  hd // Hemo hecho una copia de hd y ahora sus datos estan alojados en una variable
print("\(cinema.width) x \(cinema.height)") // 1920 x 1080
cinema.width = 2048
print("\(cinema.width) x \(cinema.height)") // 2040 x 1080
print(hd) // los valores de la contsante hd no cambian porque cinema es una copia de hd y no afecta a la constante (Estructuras)
print("\(hd.width) x \(hd.height)") // 1920 x 1080

//_____________________________________________
//
//... ENUM, DATOS COPIADOS
//
//_____________________________________________

enum CompassPoint {
    case north, south, east, west
}

var currentDirection = CompassPoint.north
let oldDirection = currentDirection
currentDirection = .south

print(currentDirection)
print(oldDirection)
// Los enumerados al igual que la estrcutura tienen valor, asi que cuando asignamos un valor a una variable, estaoms asignando a la variable una COPIA

//_____________________________________________
//
//... CLASES: DATOS REFERENCIADOS (NO COPIAN VALORES)
//
//_____________________________________________

// Si modifico una variable referenciada o el valor inicial de la clase, ambas se veran afectadas.

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
alsoTenEighty // Ambas fueron modificadas y quedan exactamente igual porque videoMode se extiende de una clase (Cambiaste la copia, cambiaste el padre)
tenEighty // Ambas fueron modificadas y quedan exactamente igual porque videoMode se extiende de una clase

//Para comparar objetos es necesario usar el ===
if tenEighty === alsoTenEighty {
    print("Son el mismo objeto") // Son el mismo objeto porque proceden de la misma constante
} else {
    print("Son objetos diferentes")
}
