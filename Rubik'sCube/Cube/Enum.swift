//
//  Enum.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/08.
//

import Foundation

enum Direction: String {
    case upperRight = "R"
    case lowerRight = "r"
    case upperLeft = "L"
    case lowerLeft = "l"
}

enum Action: String {
    case leftFirstLine = "U"
    case rightFirstLine = "U'"
    
    case leftLastLine = "B'"
    case righLastLine = "B"
    
    case upMostRightLine = "R"
    case downMostRightLine = "R'"
    
    case upMostLeftLine = "L'"
    case downMostLeftLine = "L"
    
    case frontClockwise = "F"
    case frontAntiClockwise = "F'"
    
    case bye = "Q"
}
