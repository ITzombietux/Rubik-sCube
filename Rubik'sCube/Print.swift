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
    
            guard myRubiksCube.key != "Q" else {
                print("조작갯수: \(UserDefaults.standard.integer(forKey: UserDefaults.Keys.pushOutCount))")
                print("이용해주셔서 감사합니다. 뚜뚜뚜.")
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
