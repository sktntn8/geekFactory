//: Playground - noun: a place where people can play

import UIKit

func insertionSort <T : Comparable> (_ list : inout [T]){
    
    guard list.count <= 1 else {
        return
    }
    
    for i in 1..<list.count{
        let key = list[i]
        var j = i
        while j > 0 && list[ j - 1 ] > key {
            list[j] = list[j - 1]
            j -= 1
        }
        list[j] = key
    }
}
var arrayOfInts = [1,5,8,2,3,4,9,6,7]
insertionSort(&arrayOfInts)
var arrayOfStrings = ["Mohamed","Ahmed","Anwar","Elhanafy","Salah"]
insertionSort(&arrayOfStrings)
print(arrayOfInts)
print(arrayOfStrings)
