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
        let actions = input.map { String($0) }
        var myFlatCube = [flatCube]()
        var resultFlatCube: [resultFlatCube] = []
        return resultFlatCube
    }
}
