//
//  RubiksCube.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/09.
//

import Foundation

typealias rubiksCube = [flatCube]

struct RubiksCube {
    private(set) var groups: rubiksCube
    private(set) var actions = [String]()
    
    init(groups: rubiksCube) {
        self.groups = groups
    }
    
    mutating func move(input: String) -> [resultFlatCube] {
        let actions = makeAction(input)
        var myFlatCube = [flatCube]()
        var resultFlatCube: [resultFlatCube] = []
        
        return resultFlatCube
    }
    
    private mutating func makeAction(_ input: String) -> [String] {
        var result = [String]()
        let actions = input.map { String($0) }
        
        for i in 0..<actions.count {
            if actions[i] == "'" {
                let action = actions[i-1] + "'"
                result.popLast()
                result.append(action)
            } else if actions[i] == "2" {
                let action = actions[i-2] + actions[i-1] + "2"
                result.popLast()
                result.append(action)
            } else {
                result.append(actions[i])
            }
        }
        
        return result
    }
}
