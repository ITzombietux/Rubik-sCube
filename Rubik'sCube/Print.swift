//
//  Print.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/07.
//

import Foundation

struct Print {
    func printLine(_ line: [String]) {
        print(line.reduce("", { $0 + $1 }))
    }
    
    //MARK:- 평면 큐브
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
    
    //MARK:- 루빅스 큐브
    func printRubiksCube(myRubiksCubes: [resultRubiksCube], initRubiksCube: RubiksCube) {
        myRubiksCubes.forEach { myRubiksCube in
        
            guard myRubiksCube.value != initRubiksCube.groups else {
                print("모든 면을 맞추었습니다. 축하합니다.!!🎉🎉🎉")
                return
            }
            
            print(myRubiksCube.key)
            myRubiksCube.value.forEach { cubes in
                for cube in cubes {
                    for element in cube {
                        print(element, terminator: " ")
                    }
                    print("")
                }
                print("")
            }
            print("")
        }
    }
    
    func initPrintRubiksCube(_ initRubiksCube: RubiksCube) {
        initRubiksCube.groups.forEach { cubes in
            for cube in cubes {
                for element in cube {
                    print(element, terminator: " ")
                }
                print(" ")
            }
            print(" ")
        }
    }
}
