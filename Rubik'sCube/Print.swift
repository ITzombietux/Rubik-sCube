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
    
    func printFlatCube(_ flatCubes: [resultFlatCube]) {
        flatCubes.forEach { cubes in
            print(cubes.key)
            for cube in cubes.value {
                for element in cube {
                    print(element, terminator: " ")
                }
                print("")
            }
            print("")
        }
    }
    
    func initPrintFlatCube(_ initFlatCube: flatCube) {
        for line in initFlatCube {
            for element in line {
                print(element, terminator: " ")
            }
            print("")
        }
    }
}