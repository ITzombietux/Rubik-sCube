//
//  Enum.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/08.
//

import Foundation

enum RubikDirection: String {
    case upperRight = "R"
    case lowerRight = "r"
    case upperLeft = "L"
    case lowerLeft = "l"
}

enum FlatAction: String {
    case leftFirstLine = "U"
    case rightFirstLine = "U'"
    
    case leftLastLine = "B'"
    case righLastLine = "B"
    
    case upMostRightLine = "R"
    case downMostRightLine = "R'"
    
    case upMostLeftLine = "L'"
    case downMostLeftLine = "L"
    
    case bye = "Q"
}
