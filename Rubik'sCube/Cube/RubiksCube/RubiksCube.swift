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
        
        switch move {
        case .topFlatClockwise:
            return pushOutTopFlatClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
        case .frontClockwise:
            return pushOutFrontClockwise([groups[0][2], [groups[3][0][0], groups[3][1][0], groups[3][2][0]], groups[5][0], [groups[1][0][2], groups[1][1][2], groups[1][2][2]]])
        case .frontAntiClockwise:
            return pushOutFrontAntiClockwise([groups[0][2], [groups[3][0][0], groups[3][1][0], groups[3][2][0]], groups[5][0], [groups[1][0][2], groups[1][1][2], groups[1][2][2]]])
        case .topFlatAntiClockwise:
            return pushOutTopFlatAntiClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
        case .leftFlatClockwise:
            return pushOutLeftFlatClockwise([[groups[0][0][0], groups[0][1][0], groups[0][2][0]], [groups[2][0][0], groups[2][1][0], groups[2][2][0]], [groups[4][0][0], groups[4][1][0], groups[4][2][0]], [groups[5][0][0], groups[5][1][0], groups[5][2][0]] ])
        case .leftFlatAntiClockwise:
            return pushOutLeftFlatAntiClockwise([[groups[0][0][0], groups[0][1][0], groups[0][2][0]], [groups[2][0][0], groups[2][1][0], groups[2][2][0]], [groups[4][0][0], groups[4][1][0], groups[4][2][0]], [groups[5][0][0], groups[5][1][0], groups[5][2][0]] ])
        case .rightFlatClockwise:
            return pushOutRightFlatClockwise([[groups[0][0][2], groups[0][1][2], groups[0][2][2]], [groups[4][0][2], groups[4][1][2], groups[4][2][2]], [groups[5][0][2], groups[5][1][2], groups[5][2][2]], [groups[2][0][2], groups[2][1][2], groups[2][2][2]] ])
        case .rightFlatAntiClockwise:
            return pushOutRightFlatAntiClockwise([[groups[0][0][2], groups[0][1][2], groups[0][2][2]], [groups[4][0][2], groups[4][1][2], groups[4][2][2]], [groups[5][0][2], groups[5][1][2], groups[5][2][2]], [groups[2][0][2], groups[2][1][2], groups[2][2][2]] ])
        case .bottomFlatClockwise:
            return pushOutBottomFlatClockwise([groups[0][0], [groups[1][0][0], groups[1][1][0], groups[1][2][0]], groups[5][2], [groups[3][0][2], groups[3][1][2], groups[3][2][2]]])
        case .bottomFlatAntiClockwise:
            return pushOutBottomFlatAntiClockwise([groups[0][0], [groups[1][0][0], groups[1][1][0], groups[1][2][0]], groups[5][2], [groups[3][0][2], groups[3][1][2], groups[3][2][2]]])
        case .downFlatClockwise:
            return pushOutDownFlatClockwise([groups[2][2], groups[3][2], groups[4][2], groups[1][2]])
        case .downFlatAntiClockwise:
            return pushOutDownFlatAntiClockwise([groups[2][2], groups[3][2], groups[4][2], groups[1][2]])
        
        case .frontClockwiseTwice:
            _ = pushOutFrontClockwise([groups[0][2], [groups[3][0][0], groups[3][1][0], groups[3][2][0]], groups[5][0], [groups[1][0][2], groups[1][1][2], groups[1][2][2]]])
            return pushOutFrontClockwise([groups[0][2], [groups[3][0][0], groups[3][1][0], groups[3][2][0]], groups[5][0], [groups[1][0][2], groups[1][1][2], groups[1][2][2]]])
        case .frontAntiClockwiseTwice:
            _ = pushOutFrontAntiClockwise([groups[0][2], [groups[3][0][0], groups[3][1][0], groups[3][2][0]], groups[5][0], [groups[1][0][2], groups[1][1][2], groups[1][2][2]]])
            return pushOutFrontAntiClockwise([groups[0][2], [groups[3][0][0], groups[3][1][0], groups[3][2][0]], groups[5][0], [groups[1][0][2], groups[1][1][2], groups[1][2][2]]])
        case .topFlatClockwiseTwice:
            _ = pushOutTopFlatClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
            return pushOutTopFlatClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
        case .topFlatAntiClockwiseTwice:
            _ = pushOutTopFlatAntiClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
            return pushOutTopFlatAntiClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
        case .leftFlatClockwiseTwice:
            _ = pushOutLeftFlatClockwise([[groups[0][0][0], groups[0][1][0], groups[0][2][0]], [groups[2][0][0], groups[2][1][0], groups[2][2][0]], [groups[4][0][0], groups[4][1][0], groups[4][2][0]], [groups[5][0][0], groups[5][1][0], groups[5][2][0]] ])
            return pushOutLeftFlatClockwise([[groups[0][0][0], groups[0][1][0], groups[0][2][0]], [groups[2][0][0], groups[2][1][0], groups[2][2][0]], [groups[4][0][0], groups[4][1][0], groups[4][2][0]], [groups[5][0][0], groups[5][1][0], groups[5][2][0]] ])
        case .leftFlatAntiClockwiseTwice:
            _ = pushOutLeftFlatAntiClockwise([[groups[0][0][0], groups[0][1][0], groups[0][2][0]], [groups[2][0][0], groups[2][1][0], groups[2][2][0]], [groups[4][0][0], groups[4][1][0], groups[4][2][0]], [groups[5][0][0], groups[5][1][0], groups[5][2][0]] ])
            return pushOutLeftFlatAntiClockwise([[groups[0][0][0], groups[0][1][0], groups[0][2][0]], [groups[2][0][0], groups[2][1][0], groups[2][2][0]], [groups[4][0][0], groups[4][1][0], groups[4][2][0]], [groups[5][0][0], groups[5][1][0], groups[5][2][0]] ])
        case .rightFlatClockwiseTwice:
            _ = pushOutRightFlatClockwise([[groups[0][0][2], groups[0][1][2], groups[0][2][2]], [groups[4][0][2], groups[4][1][2], groups[4][2][2]], [groups[5][0][2], groups[5][1][2], groups[5][2][2]], [groups[2][0][2], groups[2][1][2], groups[2][2][2]] ])
            return pushOutRightFlatClockwise([[groups[0][0][2], groups[0][1][2], groups[0][2][2]], [groups[4][0][2], groups[4][1][2], groups[4][2][2]], [groups[5][0][2], groups[5][1][2], groups[5][2][2]], [groups[2][0][2], groups[2][1][2], groups[2][2][2]] ])
        case .rightFlatAntiClockwiseTwice:
            _ = pushOutRightFlatAntiClockwise([[groups[0][0][2], groups[0][1][2], groups[0][2][2]], [groups[4][0][2], groups[4][1][2], groups[4][2][2]], [groups[5][0][2], groups[5][1][2], groups[5][2][2]], [groups[2][0][2], groups[2][1][2], groups[2][2][2]] ])
            return pushOutRightFlatAntiClockwise([[groups[0][0][2], groups[0][1][2], groups[0][2][2]], [groups[4][0][2], groups[4][1][2], groups[4][2][2]], [groups[5][0][2], groups[5][1][2], groups[5][2][2]], [groups[2][0][2], groups[2][1][2], groups[2][2][2]] ])
        case .bottomFlatClockwiseTwice:
            _ = pushOutBottomFlatClockwise([groups[0][0], [groups[1][0][0], groups[1][1][0], groups[1][2][0]], groups[5][2], [groups[3][0][2], groups[3][1][2], groups[3][2][2]]])
            return pushOutBottomFlatClockwise([groups[0][0], [groups[1][0][0], groups[1][1][0], groups[1][2][0]], groups[5][2], [groups[3][0][2], groups[3][1][2], groups[3][2][2]]])
        case .bottomFlatAntiClockwiseTwice:
            _ = pushOutBottomFlatAntiClockwise([groups[0][0], [groups[1][0][0], groups[1][1][0], groups[1][2][0]], groups[5][2], [groups[3][0][2], groups[3][1][2], groups[3][2][2]]])
            return pushOutBottomFlatAntiClockwise([groups[0][0], [groups[1][0][0], groups[1][1][0], groups[1][2][0]], groups[5][2], [groups[3][0][2], groups[3][1][2], groups[3][2][2]]])
        case .downFlatClockwiseTwice:
            _ = pushOutDownFlatClockwise([groups[2][2], groups[3][2], groups[4][2], groups[1][2]])
            return pushOutDownFlatClockwise([groups[2][2], groups[3][2], groups[4][2], groups[1][2]])
        case .downFlatAntiClockwiseTwice:
            _ = pushOutDownFlatAntiClockwise([groups[2][2], groups[3][2], groups[4][2], groups[1][2]])
            return pushOutDownFlatAntiClockwise([groups[2][2], groups[3][2], groups[4][2], groups[1][2]])
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
