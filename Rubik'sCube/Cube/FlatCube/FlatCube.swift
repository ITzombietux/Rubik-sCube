//
//  FlatCube.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/08.
//

import Foundation

typealias flatCube = [[String]]
typealias resultFlatCube = (key: String, value: flatCube)

struct FlatCube {
    private(set) var groups: flatCube
    private(set) var actions = [String]()
    
    init(groups: flatCube) {
        self.groups = groups
    }
    
    mutating func move(input: String) -> [resultFlatCube] {
        let actions = makeAction(input)
        var myFlatCube = [flatCube]()
        var resultFlatCube: [resultFlatCube] = []
        
        for action in actions {
            myFlatCube.append(pushOut(action))
        }
        
        resultFlatCube = zip(actions, myFlatCube).map { (key: $0, value: $1) }
        
        return resultFlatCube
    }
    
    private mutating func makeAction(_ input: String) -> [String] {
        var result = [String]()
        
        var actions = input.map { String($0) }
        
        for i in 0..<actions.count {
            if actions[i] == "'" {
                let action = actions[i-1] + "'"
                result.popLast()
                result.append(action)
            } else {
                result.append(actions[i])
            }
        }
        
        return result
    }
    
    private mutating func pushOut(_ action: String) -> flatCube {
        let move = Action(rawValue: action)
        
        switch move {
        case .leftFirstLine:
            return leftPushOut(groups[0], index: 0)
        case . rightFirstLine:
            return rightPushOut(groups[0], index: 0)
        case .leftLastLine:
            return leftPushOut(groups[2], index: 2)
        case .righLastLine:
            return rightPushOut(groups[2], index: 2)
        case .upMostLeftLine:
            return leftPushOut([groups[0][0], groups[1][0], groups[2][0]], index: 4)
        case .downMostLeftLine:
            return rightPushOut([groups[0][0], groups[1][0], groups[2][0]], index: 4)
        case .upMostRightLine:
            return leftPushOut([groups[0][2], groups[1][2], groups[2][2]], index: 5)
        case .downMostRightLine :
            return rightPushOut([groups[0][2], groups[1][2], groups[2][2]], index: 5)
        case .bye:
            print("Bye~")
        default:
            break
        }
        
        return []
    }
    
    private mutating func rightPushOut(_ target: [String], index: Int) -> flatCube {
        var emptyStack = Stack(wordStack: [])
        var lineStack = Stack(wordStack: target)
        
        emptyStack.push(lineStack.pop() ?? "")
        lineStack.insert(emptyStack.pop() ?? "")
        
        guard index != 4 else {
            groups[0][0] = lineStack.wordStack[0]
            groups[1][0] = lineStack.wordStack[1]
            groups[2][0] = lineStack.wordStack[2]
            
            return groups
        }
        
        guard index != 5 else {
            groups[0][2] = lineStack.wordStack[0]
            groups[1][2] = lineStack.wordStack[1]
            groups[2][2] = lineStack.wordStack[2]
            
            return groups
        }
        
        groups[index] = lineStack.wordStack
        
        return groups
    }
    
    private mutating func leftPushOut(_ target: [String], index: Int) -> flatCube {
        var emptyQueue = Queue(wordQueue: [])
        var lineQueue = Queue(wordQueue: target)
        
        emptyQueue.enqueue(lineQueue.dequeue() ?? "")
        lineQueue.enqueue(emptyQueue.dequeue() ?? "")
        
        guard index != 4 else {
            groups[0][0] = lineQueue.wordQueue[0]
            groups[1][0] = lineQueue.wordQueue[1]
            groups[2][0] = lineQueue.wordQueue[2]
            
            return groups
        }
        
        guard index != 5 else {
            groups[0][2] = lineQueue.wordQueue[0]
            groups[1][2] = lineQueue.wordQueue[1]
            groups[2][2] = lineQueue.wordQueue[2]
            
            return groups
        }
        
        groups[index] = lineQueue.wordQueue

        return groups
    }
}
