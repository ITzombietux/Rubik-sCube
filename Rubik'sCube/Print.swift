//
//  Print.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/07.
//

import Foundation

struct Print {
    func printRubiksCube(_ rubiksCube: [String]) {
        print(rubiksCube.reduce("", { $0 + $1 }))
    }
    
    func printFlatCube(_ flatCube: [[String]]) {
        for line in flatCube {
            for element in line {
                print(element, terminator: " ")
            }
            print("")
        }
    }
}
