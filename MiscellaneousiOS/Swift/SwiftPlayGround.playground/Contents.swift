//: Playground - noun: a place where people can play
//Josue Hernandez - @jghg02

import UIKit

//Array
let d = [String]() //Empty Array

let numbers : [Int?] = [2,3,4,45,6]

let data : [String!] = ["aaaaa","bbbbb","ccccc","ddddd","xxxxx"]

//for 
for current_obejct in data {
    NSLog("Value \(current_obejct)")
}

for current_number in numbers {
    NSLog("Number \(current_number)")
}

//Enumerate
for (index,dato) in data.enumerate() {
    NSLog("Index: \(index) - Data: \(dato)")
}
