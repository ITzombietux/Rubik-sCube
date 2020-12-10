//
//  RubiksCube.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/09.
//

import Foundation

typealias rubiksCube = [flatCube]
typealias resultRubiksCube = (key: String, value: rubiksCube)

struct RubiksCube {
    private(set) var groups: rubiksCube
    private(set) var actions = [String]()
    
    init(groups: rubiksCube) {
        self.groups = groups
    }
    
    mutating func move(input: String) -> [resultRubiksCube] {
        let actions = makeAction(input)
        var myRubiksCube = [rubiksCube]()
        var myResultRubiksCube: [resultRubiksCube] = []
        
        for action in actions {
            myRubiksCube.append(pushOut(action))
        }
        
        myResultRubiksCube = zip(actions, myRubiksCube).map { (key: $0, value: $1) }
        return myResultRubiksCube
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
    
    private mutating func pushOut(_ action: String) -> rubiksCube {
        let move = RubiksCubeAction(rawValue: action)
        
        switch move {
        case .topFlatClockwise:
//            print()
            return pushOutTopFlatClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
        case .frontClockwise:
            print()
        case .frontAntiClockwise:
            print()
        case .topFlatAntiClockwise:
            print()
        case .leftFlatClockwise:
            print()
        case .leftFlatAntiClockwise:
            print()
        case .rightFlatClockwise:
            print()
        case .rightFlatAntiClockwise:
            print()
        case .bye:
            print()
        case .none:
            print()
        }
        
        return []
    }
    
    private mutating func pushOutTopFlatClockwise(_ target: [[String]]) -> rubiksCube {
        
        print("##target",target)
        
        return groups
    }
}
