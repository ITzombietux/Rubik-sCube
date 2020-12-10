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

enum FlatCubeAction: String {
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

enum RubiksCubeAction: String {
    case frontClockwise = "F"
    case frontAntiClockwise = "F'"
    
    case topFlatClockwise = "U"
    case topFlatAntiClockwise = "U'"
    
    case leftFlatClockwise = "L"
    case leftFlatAntiClockwise = "L'"
    
    case rightFlatClockwise = "R"
    case rightFlatAntiClockwise = "R'"
    
    case bottomFlatClockwise = "B"
    case bottomFlatAntiClockwise = "B'"
    
    case downFlatClockwise = "D"
    case downFlatAntiClockwise = "D'"
    
    case bye = "Q"
}
