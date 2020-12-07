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
    func input() -> (word, number, direction) {
        let inputArr = readLine() ?? ""
        let splitedInputArr = inputArr.components(separatedBy: " ")
        let word = splitedInputArr[0]
        let number = Int(splitedInputArr[1])
        let direction = splitedInputArr[2]

        return (word, number ?? 1, direction)
    }
}
