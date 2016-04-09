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

Un bloque que retorna un Int: 

	var total : Int = 0

	var myblock : (Int) -> Int = { (moc: Int!) in
    	total += moc
	    NSLog("Valor de Total dentro del bloque \(total)")
    	return total
    
	}

	var t : Int = myblock(30) + 40


***

### Mutable Array

Los tipos de datos Mutable son aquellos que pueden ser modificados en tiempo de ejecución. 


__Objective-C__:

_Declaración_:

	NSMutableArray *mutable = [[NSMutableArray alloc] initWithObjects:@"CAN", @"TO", @"CA", @"VZLA", nil];
	
Para acceder a los valores dentro de _NSMUtableArray_:

	//For
    for (id current_data in mutable){
        NSLog(@"Ecah Data into NSMutableArray: %@",current_data);
    }
    
Agregando un nuevo elemento al _NSMutabeArray__:

	//Add values into Mutable Array
    [mutable addObject:@"NEW OBJECT"];
    
__Swift__:

_Declaración_:

	var dataMutable : NSMutableArray! = ["CAN","VZLA"]
	
Para acceder a los Valore: 

	//For.
	for current_data in dataMutable! {
    	NSLog("Current data \(current_data)")
	}

	//Enumerate
	for c in dataMutable.enumerate(){
    	NSLog("\(c)")
	}
	
Para agregar un valor: 

	dataMutable?.addObject("STGO")


***

### Sort

__Objective-C__:

	    //Sort
    [mutable sortUsingSelector:@selector(caseInsensitiveCompare:)];
    
__Swift__:

	//Sort
	dataMutable.sortUsingSelector("caseInsensitiveCompare:")
	for (i,d) in dataMutable.enumerate(){
    	NSLog("index-> \(i) --- data-> \(d)")
	}

***

### Diccionarios

Collección de Objectos asociados entre un __key__ y un __value__

__Objective-C__:

_Declaración_:

	// Literal syntax
    NSDictionary *inventory = @{
                                @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
                                @"Mercedes-Benz E350" : [NSNumber numberWithInt:22],
                                @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                @"BMW X6" : [NSNumber numberWithInt:16],
                                };
    
    NSLog(@"Diccionario %@",inventory);
    
    // Values and keys as arrays
    NSArray *models = @[@"Mercedes-Benz SLK250", @"Mercedes-Benz E350",
                        @"BMW M3 Coupe", @"BMW X6"];
    NSArray *stock = @[[NSNumber numberWithInt:13],
                       [NSNumber numberWithInt:22],
                       [NSNumber numberWithInt:19],
                       [NSNumber numberWithInt:16]];
    inventory = [NSDictionary dictionaryWithObjects:stock forKeys:models];
    NSLog(@"%@", inventory);


_Acceciendo a los valores_:

	NSLog(@"Value :%@",inventory[@"BMW M3 Coupe"]);
	
_Recorriendo un Diccionario_:

	//For
	for (id key in inventory) {
        NSLog(@"Ecah Key: %@",key);
        NSLog(@"Ecah value: %@",inventory[key]);
    }
    
__Swift__:

_Declaración_:

	//Dictionaries 
	let dictionary : [String:String!] = ["1":"STGO","2":"VZLA","3":"CAN"]
	NSLog("my dictionary: \(dictionary)")
	
_Accedcioendo a los valores_:

	let valor = dictionary["2"]
	NSLog("Value \(valor)")

_Recorriendo un Diccionario_:

	for (key,value) in dictionary.enumerate() {
    	NSLog("Each key \(key)")
    	NSLog("Each Value \(value)")
	}	

***

### GDA (Grand Central Dispatch)


Proceso que gestiona los hilos de ejecución en __OS X__ y __iOS__.  [libdispatch](http://libdispatch.macosforge.org/)


Las Clases principales son __NSOperation__ y __NSOperationQueue__.

- _NSOperation_ : Creamos las acciones que queremos enviar a otro hilo.
- _NSOperationQueue_ : Gestiona los hilos generados.

- _NSInvocationOperation_ :  Genera una tarea que llama a un método(@selector) determinado sobre un objeto ya existente. Es apropiada en el caso que tu código ya realiza una tarea (la que queremos mandar a otro hilo) en una clase ya existente.

		// Creamos la cola
		NSOperationQueue *queue = [[NSOperationQueue alloc] init];
		// Creamos la operación
		NSInvocationOperation *indexOperation = [[NSInvocationOperation alloc] initWithTarget:self  
	    selector:@selector(downloadImageURLs) object:nil];
		// Añadimos la operación a la cola
		[queue addOperation:indexOperation];
		
- _NSBlockOperation_ : Esta es similar a la anterior lo único que en vez de llamar a un método, ejecuta un bloque.

		// Creamos la cola
		NSOperationQueue *queue = [[NSOperationQueue alloc] init];
		// Creamos la operación
		NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock: ^{
		      NSLog(@"Inicio del bloque...");
	      // Hacemos algo
   		}];
		// Añadimos la operación a la cola
		[queue addOperation:blockOperation];



__Hilos__

	NSURL *url = [NSURL URLWithString:@"https://c1.staticflickr.com/7/6189/6153717796_06b95f2ff2_b.jpg"];
    
    //Cola en segundo plano
    dispatch_queue_t background = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    //Ejecutamos el bloque en modo asincrono en segundo plano
    dispatch_async(background, ^{
        
        //Obtenemos los datos de la imagen
        NSData *dataImage = [NSData dataWithContentsOfURL:url];
        
        //Creamos la imagen con la info de la URL
        UIImage *image = [[UIImage alloc] initWithData:dataImage];
        
        //Luego seteamos la imagen al UIIMageView todo esto debe estar en el hilo principal de la app
        //Asi pasamos al hilo prinipal de la app
        //Siempre debemos cambiar cualquier componente de la Interfaz en el Hilo principal de la App.
        dispatch_async(dispatch_get_main_queue(), ^{
            self.img.image = image;
        });
        
    });

__Importante__: En relación a los _hilos_ es importante que cualquier modificación que se realize a la interfaz se haga en el hilo principal de la app.


### ARC (Gestion de Memoria)

- ###Con ARC:

	__Strong__: Indica Propiedad de un objecto. 
				Se _libera la memoria_ cuando los contadores de _punteros_ llegan a _cero_.
				
	__Weak__: Cuando un objeto no nos pertenece.
			  Cuando el objeto _desaparezca de la memoria_ el _puntero sera puesto a __nil___ y cualquier mensaje retornara __cero__.
			  
			  
- ###Sin ARC:

	__Retain__: Similar a __Strong__ pero de debe liberar la memoria manualmente. La memoria puede liberarse de dos formas usando __Release__ o __Autorelease__
	
	__Assing__: Similar a __Weak__ pero el puntero no se asigna a __nil__ cuando se libera la memoria.

 


Follow [@jghg02](https://twitter.com/jghg02) on Twitter.