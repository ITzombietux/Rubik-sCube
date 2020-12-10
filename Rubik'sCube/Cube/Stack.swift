//
//  Stack.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/07.
//

import Foundation

struct Stack {
    private(set) var wordStack: [String]
    
    init(wordStack: [String]) {
        self.wordStack = wordStack
    }
    
    mutating func push(_ element: String) {
        wordStack.append(element)
    }
    
    mutating func pop() -> String? {
        return wordStack.popLast()
    }
    
    mutating func insert(_ element: String) {
        wordStack.insert(contentsOf: [element], at: 0)
    }
}

struct RubiksCubeStack {
    private(set) var lineStack: [[String]]
    
    init(lineStack: [[String]]) {
        self.lineStack = lineStack
    }
    
    mutating func push(_ element: [String]) {
        lineStack.append(element)
    }
    
    mutating func pop() -> [String]? {
        return lineStack.popLast()
    }
    
    mutating func insert(_ element: [String]) {
        lineStack.insert(contentsOf: [element], at: 0)
    }
}
