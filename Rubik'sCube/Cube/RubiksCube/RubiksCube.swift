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
        let result = input.reduce(into: [String]()) {
            if $1.isUppercase || $0.isEmpty {
                $0.append("\($1)") }
            else {
                $0[$0.count - 1] = $0.last! + "\($1)"
            }
        }
        
        return result
    }
    
    private mutating func pushOut(_ action: String) -> rubiksCube {
        let move = RubiksCubeAction(rawValue: action)
        
        let resultTopFlatClockwise = pushOutTopFlatClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
        let resultTopFlatAntiClockwise = pushOutTopFlatAntiClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
        let resultFrontClockwise = pushOutFrontClockwise([groups[0][2], [groups[3][0][0], groups[3][1][0], groups[3][2][0]], groups[5][0], [groups[1][0][2], groups[1][1][2], groups[1][2][2]]])
        let resultFrontAntiClockwise = pushOutFrontAntiClockwise([groups[0][2], [groups[3][0][0], groups[3][1][0], groups[3][2][0]], groups[5][0], [groups[1][0][2], groups[1][1][2], groups[1][2][2]]])
        let resultLeftFlatClockwise = pushOutLeftFlatClockwise([[groups[0][0][0], groups[0][1][0], groups[0][2][0]], [groups[2][0][0], groups[2][1][0], groups[2][2][0]], [groups[4][0][0], groups[4][1][0], groups[4][2][0]], [groups[5][0][0], groups[5][1][0], groups[5][2][0]] ])
        let resultLeftFlatAntiClockwise = pushOutLeftFlatAntiClockwise([[groups[0][0][0], groups[0][1][0], groups[0][2][0]], [groups[2][0][0], groups[2][1][0], groups[2][2][0]], [groups[4][0][0], groups[4][1][0], groups[4][2][0]], [groups[5][0][0], groups[5][1][0], groups[5][2][0]] ])
        let resultRightFlatClockwise = pushOutRightFlatClockwise([[groups[0][0][2], groups[0][1][2], groups[0][2][2]], [groups[4][0][2], groups[4][1][2], groups[4][2][2]], [groups[5][0][2], groups[5][1][2], groups[5][2][2]], [groups[2][0][2], groups[2][1][2], groups[2][2][2]] ])
        let resultRightFlatAntiClockwise = pushOutRightFlatAntiClockwise([[groups[0][0][2], groups[0][1][2], groups[0][2][2]], [groups[4][0][2], groups[4][1][2], groups[4][2][2]], [groups[5][0][2], groups[5][1][2], groups[5][2][2]], [groups[2][0][2], groups[2][1][2], groups[2][2][2]] ])
        let resultBottomFlatClockwise = pushOutBottomFlatClockwise([groups[0][0], [groups[1][0][0], groups[1][1][0], groups[1][2][0]], groups[5][2], [groups[3][0][2], groups[3][1][2], groups[3][2][2]]])
        let resultBottomFlatAntiClockwise = pushOutBottomFlatAntiClockwise([groups[0][0], [groups[1][0][0], groups[1][1][0], groups[1][2][0]], groups[5][2], [groups[3][0][2], groups[3][1][2], groups[3][2][2]]])
        let resultDownFlatClockwise = pushOutDownFlatClockwise([groups[2][2], groups[3][2], groups[4][2], groups[1][2]])
        let resultDownFlatAntiClockwise = pushOutDownFlatAntiClockwise([groups[2][2], groups[3][2], groups[4][2], groups[1][2]])
        
        
        switch move {
        case .topFlatClockwise:
            return resultTopFlatClockwise
        case .frontClockwise:
            return resultFrontClockwise
        case .frontAntiClockwise:
            return resultFrontAntiClockwise
        case .topFlatAntiClockwise:
            return resultTopFlatAntiClockwise
        case .leftFlatClockwise:
            return resultLeftFlatClockwise
        case .leftFlatAntiClockwise:
            return resultLeftFlatAntiClockwise
        case .rightFlatClockwise:
            return resultRightFlatClockwise
        case .rightFlatAntiClockwise:
            return resultRightFlatAntiClockwise
        case .bottomFlatClockwise:
            return resultBottomFlatClockwise
        case .bottomFlatAntiClockwise:
            return resultBottomFlatAntiClockwise
        case .downFlatClockwise:
            return resultDownFlatClockwise
        case .downFlatAntiClockwise:
            return resultDownFlatAntiClockwise
        case .frontClockwiseTwice:
            _ = resultFrontClockwise
            return resultFrontClockwise
        case .frontAntiClockwiseTwice:
            _ = resultFrontAntiClockwise
            return resultFrontAntiClockwise
        case .topFlatClockwiseTwice:
            _ = resultTopFlatClockwise
            return resultTopFlatClockwise
        case .topFlatAntiClockwiseTwice:
            _ = resultTopFlatAntiClockwise
            return resultTopFlatAntiClockwise
        case .leftFlatClockwiseTwice:
            _ = resultLeftFlatClockwise
            return resultLeftFlatClockwise
        case .leftFlatAntiClockwiseTwice:
            _ = resultLeftFlatAntiClockwise
            return resultLeftFlatAntiClockwise
        case .rightFlatClockwiseTwice:
            _ = resultRightFlatClockwise
            return resultRightFlatClockwise
        case .rightFlatAntiClockwiseTwice:
            _ = resultRightFlatAntiClockwise
            return resultRightFlatAntiClockwise
        case .bottomFlatClockwiseTwice:
            _ = resultBottomFlatClockwise
            return resultBottomFlatClockwise
        case .bottomFlatAntiClockwiseTwice:
            _ = resultBottomFlatAntiClockwise
            return resultBottomFlatAntiClockwise
        case .downFlatClockwiseTwice:
            _ = resultDownFlatClockwise
            return resultDownFlatClockwise
        case .downFlatAntiClockwiseTwice:
            _ = resultDownFlatAntiClockwise
            return resultDownFlatAntiClockwise
        case .bye:
            print()
        case .none:
            print()
        }
        
        return []
    }
    
    private mutating func pushOutTopFlatAntiClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyStack = RubiksCubeStack(lineStack: [])
        var stack = RubiksCubeStack(lineStack: target)
        
        emptyStack.push(stack.pop() ?? [])
        stack.insert(emptyStack.pop() ?? [])
        
        groups[1][0] = stack.lineStack[0]
        groups[2][0] = stack.lineStack[1]
        groups[3][0] = stack.lineStack[2]
        groups[4][0] = stack.lineStack[3]
        
        return groups
    }
    
    private mutating func pushOutTopFlatClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyQueue = RubiksCubeQueue(lineQueue: [])
        var queue = RubiksCubeQueue(lineQueue: target)
        
        emptyQueue.enqueue(queue.dequeue() ?? [])
        queue.enqueue(emptyQueue.dequeue() ?? [])
        
        groups[1][0] = queue.lineQueue[0]
        groups[2][0] = queue.lineQueue[1]
        groups[3][0] = queue.lineQueue[2]
        groups[4][0] = queue.lineQueue[3]
        
        return groups
    }
    
    private mutating func pushOutLeftFlatClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyStack = RubiksCubeStack(lineStack: [])
        var stack = RubiksCubeStack(lineStack: target)
        
        emptyStack.push(stack.pop() ?? [])
        stack.insert(emptyStack.pop() ?? [])

        groups[0][0][0] = stack.lineStack[0][0]
        groups[0][1][0] = stack.lineStack[0][1]
        groups[0][2][0] = stack.lineStack[0][2]
        groups[2][0][0] = stack.lineStack[1][0]
        groups[2][1][0] = stack.lineStack[1][1]
        groups[2][2][0] = stack.lineStack[1][2]
        groups[4][0][0] = stack.lineStack[2][0]
        groups[4][1][0] = stack.lineStack[2][1]
        groups[4][2][0] = stack.lineStack[2][2]
        groups[5][0][0] = stack.lineStack[3][0]
        groups[5][1][0] = stack.lineStack[3][1]
        groups[5][2][0] = stack.lineStack[3][2]
        
        return groups
    }
    
    private mutating func pushOutLeftFlatAntiClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyQueue = RubiksCubeQueue(lineQueue: [])
        var queue = RubiksCubeQueue(lineQueue: target)
        
        emptyQueue.enqueue(queue.dequeue() ?? [])
        queue.enqueue(emptyQueue.dequeue() ?? [])

        groups[0][0][0] = queue.lineQueue[0][0]
        groups[0][1][0] = queue.lineQueue[0][1]
        groups[0][2][0] = queue.lineQueue[0][2]
        groups[2][0][0] = queue.lineQueue[1][0]
        groups[2][1][0] = queue.lineQueue[1][1]
        groups[2][2][0] = queue.lineQueue[1][2]
        groups[4][0][0] = queue.lineQueue[2][0]
        groups[4][1][0] = queue.lineQueue[2][1]
        groups[4][2][0] = queue.lineQueue[2][2]
        groups[5][0][0] = queue.lineQueue[3][0]
        groups[5][1][0] = queue.lineQueue[3][1]
        groups[5][2][0] = queue.lineQueue[3][2]
        
        return groups
    }
    
    private mutating func pushOutFrontClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyStack = RubiksCubeStack(lineStack: [])
        var stack = RubiksCubeStack(lineStack: target)
        
        emptyStack.push(stack.pop() ?? [])
        stack.insert(emptyStack.pop() ?? [])
                
        groups[0][2] = stack.lineStack[0]
        groups[3][0][0] = stack.lineStack[1][0]
        groups[3][1][0] = stack.lineStack[1][1]
        groups[3][2][0] = stack.lineStack[1][1]
        groups[5][0] = stack.lineStack[2]
        groups[1][0][2] = stack.lineStack[3][0]
        groups[1][1][2] = stack.lineStack[3][1]
        groups[1][2][2] = stack.lineStack[3][2]
        
        return groups
    }
    
    private mutating func pushOutFrontAntiClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyQueue = RubiksCubeQueue(lineQueue: [])
        var queue = RubiksCubeQueue(lineQueue: target)
        
        emptyQueue.enqueue(queue.dequeue() ?? [])
        queue.enqueue(emptyQueue.dequeue() ?? [])
                
        groups[0][2] = queue.lineQueue[0]
        groups[3][0][0] = queue.lineQueue[1][0]
        groups[3][1][0] = queue.lineQueue[1][1]
        groups[3][2][0] = queue.lineQueue[1][1]
        groups[5][0] = queue.lineQueue[2]
        groups[1][0][2] = queue.lineQueue[3][0]
        groups[1][1][2] = queue.lineQueue[3][1]
        groups[1][2][2] = queue.lineQueue[3][2]
        
        return groups
    }
    
    private mutating func pushOutRightFlatClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyStack = RubiksCubeStack(lineStack: [])
        var stack = RubiksCubeStack(lineStack: target)
        
        emptyStack.push(stack.pop() ?? [])
        stack.insert(emptyStack.pop() ?? [])
        
        groups[0][0][2] = stack.lineStack[0][0]
        groups[0][1][2] = stack.lineStack[0][1]
        groups[0][2][2] = stack.lineStack[0][2]
        groups[4][0][2] = stack.lineStack[1][0]
        groups[4][1][2] = stack.lineStack[1][1]
        groups[4][2][2] = stack.lineStack[1][2]
        groups[5][0][2] = stack.lineStack[2][0]
        groups[5][1][2] = stack.lineStack[2][1]
        groups[5][2][2] = stack.lineStack[2][2]
        groups[2][0][2] = stack.lineStack[3][0]
        groups[2][1][2] = stack.lineStack[3][1]
        groups[2][2][2] = stack.lineStack[3][2]
        
        return groups
    }
    
    private mutating func pushOutRightFlatAntiClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyQueue = RubiksCubeQueue(lineQueue: [])
        var queue = RubiksCubeQueue(lineQueue: target)
        
        emptyQueue.enqueue(queue.dequeue() ?? [])
        queue.enqueue(emptyQueue.dequeue() ?? [])
        
        groups[0][0][2] = queue.lineQueue[0][0]
        groups[0][1][2] = queue.lineQueue[0][1]
        groups[0][2][2] = queue.lineQueue[0][2]
        groups[4][0][2] = queue.lineQueue[1][0]
        groups[4][1][2] = queue.lineQueue[1][1]
        groups[4][2][2] = queue.lineQueue[1][2]
        groups[5][0][2] = queue.lineQueue[2][0]
        groups[5][1][2] = queue.lineQueue[2][1]
        groups[5][2][2] = queue.lineQueue[2][2]
        groups[2][0][2] = queue.lineQueue[3][0]
        groups[2][1][2] = queue.lineQueue[3][1]
        groups[2][2][2] = queue.lineQueue[3][2]
        
        return groups
    }
    
    private mutating func pushOutBottomFlatClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyStack = RubiksCubeStack(lineStack: [])
        var stack = RubiksCubeStack(lineStack: target)
        
        emptyStack.push(stack.pop() ?? [])
        stack.insert(emptyStack.pop() ?? [])
        
        groups[0][0] = stack.lineStack[0]
        groups[1][0][0] = stack.lineStack[1][0]
        groups[1][1][0] = stack.lineStack[1][1]
        groups[1][2][0] = stack.lineStack[1][2]
        groups[5][2] = stack.lineStack[2]
        groups[3][0][2] = stack.lineStack[3][0]
        groups[3][1][2] = stack.lineStack[3][1]
        groups[3][2][2] = stack.lineStack[3][2]
        
        return groups
    }
    
    private mutating func pushOutBottomFlatAntiClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyQueue = RubiksCubeQueue(lineQueue: [])
        var queue = RubiksCubeQueue(lineQueue: target)
        
        emptyQueue.enqueue(queue.dequeue() ?? [])
        queue.enqueue(emptyQueue.dequeue() ?? [])
        
        groups[0][0] = queue.lineQueue[0]
        groups[1][0][0] = queue.lineQueue[1][0]
        groups[1][1][0] = queue.lineQueue[1][1]
        groups[1][2][0] = queue.lineQueue[1][2]
        groups[5][2] = queue.lineQueue[2]
        groups[3][0][2] = queue.lineQueue[3][0]
        groups[3][1][2] = queue.lineQueue[3][1]
        groups[3][2][2] = queue.lineQueue[3][2]
        
        return groups
    }
    
    private mutating func pushOutDownFlatClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyStack = RubiksCubeStack(lineStack: [])
        var stack = RubiksCubeStack(lineStack: target)
        
        emptyStack.push(stack.pop() ?? [])
        stack.insert(emptyStack.pop() ?? [])
        
        groups[2][2] = stack.lineStack[0]
        groups[3][2] = stack.lineStack[1]
        groups[4][2] = stack.lineStack[2]
        groups[1][2] = stack.lineStack[3]
        
        return groups
    }
    
    private mutating func pushOutDownFlatAntiClockwise(_ target: [[String]]) -> rubiksCube {
        var emptyQueue = RubiksCubeQueue(lineQueue: [])
        var queue = RubiksCubeQueue(lineQueue: target)
        
        emptyQueue.enqueue(queue.dequeue() ?? [])
        queue.enqueue(emptyQueue.dequeue() ?? [])
       
        groups[2][2] = queue.lineQueue[0]
        groups[3][2] = queue.lineQueue[1]
        groups[4][2] = queue.lineQueue[2]
        groups[1][2] = queue.lineQueue[3]
        
        return groups
    }
}
