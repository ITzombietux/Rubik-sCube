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
        var lastFlatCubes: [flatCube] = []
        
        myRubiksCubes.forEach { myRubiksCube in
            guard myRubiksCube.key != "Q" else {
                print("조작갯수: \(UserDefaults.standard.integer(forKey: UserDefaults.Keys.pushOutCount))")
                print("이용해주셔서 감사합니다. 뚜뚜뚜.")
                return
            }
            print(myRubiksCube.key)
            lastFlatCubes = myRubiksCube.value
            
            myRubiksCube.value.forEach { cubes in
                printRubiksElement(cubes: cubes)
            }
        }
        restart(lastFlatCubes)
    }
    
    func initPrintRubiksCube(_ initRubiksCube: RubiksCube) {
        initRubiksCube.groups.forEach { cubes in
            printRubiksElement(cubes: cubes)
        }
    }
    
    private func printRubiksElement(cubes: [[String]]) {
        for cube in cubes {
            for element in cube {
                print(element, terminator: " ")
            }
            print()
        }
        print()
    }
    
    private func restart(_ lastFlatCubes: [flatCube]) {
        let myInput = Input()
        let myPrint = Print()
        
        var resultrRubiksCube = RubiksCube(groups: lastFlatCubes)
        let inputAction = myInput.rubiksCubeInput()
        let myRubiksCube = resultrRubiksCube.move(input: inputAction)
        myPrint.printRubiksCube(myRubiksCubes: myRubiksCube, initRubiksCube: RubiksCube.init(groups: []))
    }
    
    private func setPushOutCount() {
        
    }
}
