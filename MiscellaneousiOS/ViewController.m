//
//  ViewController.m
//  MiscellaneousiOS
//
//  Created by Josue Hernandez on 1/29/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//Bloque
typedef void (^MiTipoBloque)(int);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSArray - Inmutable
    
    //NSArray *array = [[NSArray alloc] initWithObjects:@"iOS", @"Android", @"Phone", nil];
    NSArray *array = @[@"JOSUE",@"Hernandez",@"Santiago",@"Canada",@"Toronto"];
    NSLog(@"Log %lu",(unsigned long)[array count]);
    
    //For
    for (int i = 0 ; i < [array count]; i++) {
        id ob = array[i];
        NSLog(@"Each Element %@",ob);
    }
    
    //For in
    for (id current_object in array) {
        NSLog(@"data %@",current_object);
    }
    
    //Block
    [array enumerateObjectsUsingBlock:^(id obj,
                                        NSUInteger idx,
                                        BOOL *stop) {
        NSLog(@"index: %ld Value: %@", idx, obj);
    }];

    
    //Definifion del bloque
    MiTipoBloque myBlock;
    __block int total = 0;
    myBlock = ^void(int to){
        total += to;
        NSLog(@"Valor del Total %i",total);
    };
    
    //Ejecucion del bloque
    myBlock(2);
    myBlock(200);
    
    
    
    //NSMUtableArray
    NSMutableArray *mutable = [[NSMutableArray alloc] initWithObjects:@"CAN", @"TO", @"CA", @"VZLA", nil];
    
    //Lenght
    NSLog(@"Lenght Mutable Array %lu",(unsigned long)[mutable count]);
    
    //For
    for (id current_data in mutable){
        NSLog(@"Ecah Data into NSMutableArray: %@",current_data);
    }
    
    //Add values into Mutable Array
    [mutable addObject:@"NEW OBJECT"];
    
    NSLog(@"Lenght Mutable Array %lu",(unsigned long)[mutable count]);
    
    //For
    for (id current_data in mutable){
        NSLog(@"Ecah Data into NSMutableArray: %@",current_data);
    }
    
    
    //Sort
    [mutable sortUsingSelector:@selector(caseInsensitiveCompare:)];
    
    for (id c in mutable) {
        NSLog(@"Sort %@",c);
    }
    
    
    //Diccionarios
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
    
    NSLog(@"Value :%@",inventory[@"BMW M3 Coupe"]);
    
    for (id key in inventory) {
        NSLog(@"Ecah Key: %@",key);
        NSLog(@"Ecah value: %@",inventory[key]);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)getImageOnclick:(id)sender {
    NSLog(@"Getting Image");
    
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
    
}


@end
