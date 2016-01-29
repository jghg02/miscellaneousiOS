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
***
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

Follow [@jghg02](https://twitter.com/jghg02) on Twitter.