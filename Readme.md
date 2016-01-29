# Miscellaneous-iOS


Repositorio donde se presenta el manejo de estruturas basicas en Objective-C y Swift.
***

### Arrays

Para crear un __array__ _inmutable_ en __Objective-C__ se define de la siguiente forma: 

	NSArray *array = [[NSArray alloc] initWithObjects:@"iOS", @"Android", @"Phone", nil];
	
	NSArray *array = @[@"xxxx",@"yyyyy",@"iiiii",@"Canada",@"Toronto"];


Formas para recorrer un __Array__:

· __For__:

	for (int i = 0 ; i < [array count]; i++) {
        id ob = array[i];
        NSLog(@"Each Element %@",ob);
    }
    
· __For / in__:

	 for (id current_object in array) {
        NSLog(@"data %@",current_object);
     }

***

Follow [@jghg02](https://twitter.com/jghg02) on Twitter.