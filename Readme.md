# Miscellaneous-iOS


Repositorio donde se presenta el manejo de structuras basicas en Objective-C y Swift.
***

### Arrays

Para crear un __array__ _inmutable_ en __Objective-C__ se define de la siguiente forma: 

	NSArray *array = [[NSArray alloc] initWithObjects:@"iOS", @"Android", @"Phone", nil];
	
	NSArray *array = @[@"xxxx",@"yyyyy",@"iiiii",@"Canada",@"Toronto"];


Formas para recorrer un __Array__:
***
__Objective-C__

· __For__:

	for (int i = 0 ; i < [array count]; i++) {
        id ob = array[i];
        NSLog(@"Each Element %@",ob);
    }
    
· __For / in__:

	 for (id current_object in array) {
        NSLog(@"data %@",current_object);
     }
     
· __Block__:

    //Block
    [array enumerateObjectsUsingBlock:^(id obj,
                                        NSUInteger idx,
                                        BOOL *stop) {
        NSLog(@"index: %ld Value: %@", idx, obj);
    }];

__Swift__

Definición de un _arrary_:

	let data : [String!] = ["aaaaa","bbbbb","ccccc","ddddd","xxxxx"]
	
	let d = [String]() //Empty Array of String
	
	let numbers : [Int?] = [2,3,4,45,6] //Array of Int
	
Formas para recorrer un array:

· __For__:

	for current_obejct in data {
    	NSLog("Value \(current_obejct)")
	}
	
	for current_number in numbers {
    	NSLog("Number \(current_number)")
	}
	
· __Enumerate__:

	//Enumerate
	for (index,dato) in data.enumerate() {
    	NSLog("Index: \(index) - Data: \(dato)")
	}
	
***
### Blocks


Son porciones de codigo que se almacenan en variables, se pueden pasar como argumento, devolver como resultado de un mensaje. Son _funciones de primer nivel_

Los bloques se utilizan para:

- Enumeración de colectores.
- Ordenación (el bloque se proporciona como el método de comparación)
- Notificación (cuando tal cosa ocurra, ejecuta este bloque)
- Gestores de error (si ocurre un error mientras haces esto, ejecuta este bloque)
- Gestores de finalización (cuando termines de hacer esto, ejecuta este bloque)
- Animación de vistas
- multitarea mediante “Grand Dispatch Central” (GCD)

Declaración en __Obecjtive-C__:

	//Bloque
	typedef void (^MiTipoBloque)(int);
	
Definición en __Obecjtive-C__:

	MiTipoBloque myBlock;
    __block int total = 0; // modifcamos su valor dentro del Bloque
    
    myBlock = ^void(int to){
        total += to;
        NSLog(@"Valor del Total %i",total);
    };

Ejecución del Bloque: 

    myBlock(2);
    myBlock(200);
    
__Swift__:


	var total : Int = 0

Delcaración del Bloque

	var myblock : (Int) -> Void = { (moc: Int!) in
    	total += moc
	    NSLog("Valor de Total dentro del bloque \(total)")
    
	}
	
	//Variable myblock de tipo Int que ejecuta la suma del valor que se le pasa por parametro que es otro valor entero 
	
Ejecución de Bloque:
	
	myblock(2)
	myblock(4)



***

Follow [@jghg02](https://twitter.com/jghg02) on Twitter.