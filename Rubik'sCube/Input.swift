//
//  Input.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/07.
//

import Foundation

typealias word = String
typealias number = Int
typealias direction = String

struct Input {
    //MARK:- 단어 밀어내기
    func rubikCubeInput() -> (word, number, direction) {
        let inputArr = readLine() ?? ""
        let splitedInputArr = inputArr.components(separatedBy: " ")
        let word = splitedInputArr[0]
        let number = Int(splitedInputArr[1])
        let direction = splitedInputArr[2]
        
        let exception = Exception()
        
        do {
            try exception.precondition(number: number ?? 0)
        } catch {
            print("다시 시작")
            rubikCubeInput()
        }

        return (word, number ?? 1, direction)
    }
    
    //MARK:- 평면 큐브
    func flatCubeInput(initFlatCube: [[String]]) -> String {
        let myPrint = Print()
        myPrint.initPrintFlatCube(initFlatCube)
        print("\nCUBE> ", terminator: "")
        let inputString = readLine() ?? ""
        
        return inputString
    }
    
    //MARK:- 루빅스 큐브
    func rubiksCubeInput(initRubiksCube: RubiksCube) -> String {
        let myPrint = Print()
        myPrint.initPrintRubiksCube(initRubiksCube)
        
        print("\nCUBE> ", terminator: "")
        let inputString = readLine() ?? ""
        
        return inputString
    }
}
