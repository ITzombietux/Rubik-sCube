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
