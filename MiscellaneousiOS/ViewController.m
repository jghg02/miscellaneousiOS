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
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"iOS", @"Android", @"Phone", nil];
    NSLog(@"Log %lu",(unsigned long)[array count]);
    
    //For
    for (int i = 0 ; i < [array count]; i++) {
        id ob = array[i];
        NSLog(@"Each Element %@",ob);
    }
    
    for (id current_object in array) {
        NSLog(@"data %@",current_object);
    }
    
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end