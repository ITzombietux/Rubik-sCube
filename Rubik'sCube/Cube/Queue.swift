//
//  Queue.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/07.
//

import Foundation

struct Queue {
    private(set) var wordQueue: [String]
    
    init(wordQueue: [String]) {
        self.wordQueue = wordQueue
    }
    
    mutating func enqueue(_ element: String) {
        wordQueue.append(element)
    }
    
    mutating func dequeue() -> String? {
        guard !wordQueue.isEmpty else {
            return nil
        }
        
        return wordQueue.removeFirst()
    }
}

struct RubiksCubeQueue {
    private(set) var lineQueue: [[String]]
    
    init(lineQueue: [[String]]) {
        self.lineQueue = lineQueue
    }
    
    mutating func enqueue(_ element: [String]) {
        lineQueue.append(element)
    }
    
    mutating func dequeue() -> [String]? {
        guard !lineQueue.isEmpty else {
            return nil
        }
        
        return lineQueue.removeFirst()
    }
}
