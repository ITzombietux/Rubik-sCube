//
//  PushOut.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/07.
//

import Foundation

struct PushOut {
    private var word: String
    private var number: Int
    private var direction: String
    
    init(word: String, number: Int, direction: String) {
        self.word = word
        self.number = number
        self.direction = direction
    }
    
    mutating func pushOut() -> [String] {
        if self.direction == RubikDirection.upperRight.rawValue || self.direction == RubikDirection.lowerRight.rawValue {
            return rightPushOut()
        } else if self.direction == RubikDirection.upperLeft.rawValue || self.direction == RubikDirection.lowerLeft.rawValue {
            return leftPushOut()
        }
        
        return [String]()
    }
    
    private mutating func rightPushOut() -> [String] {
        var emptyStack = Stack(wordStack: [])
        var stack = Stack(wordStack: self.word.map { String($0) })
        
        if self.number < 0 {
            self.number = abs(self.number)
            return leftPushOut()
        }
        
        for _ in 0..<self.number {
            emptyStack.push(stack.pop() ?? "")
            stack.insert(emptyStack.pop() ?? "")
        }

        return stack.wordStack
    }
    
    private mutating func leftPushOut() -> [String] {
        var emptyQueue = Queue(wordQueue: [])
        var queue = Queue(wordQueue: self.word.map { String($0) })
        
        if self.number < 0 {
            self.number = abs(self.number)
            return rightPushOut()
        }
        
        for _ in 0..<self.number {
            emptyQueue.enqueue(queue.dequeue() ?? "")
            queue.enqueue(emptyQueue.dequeue() ?? "")
        }
        
        return queue.wordQueue
    }
}
