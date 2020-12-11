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
    case frontClockwiseTwice = "F2"
    case frontAntiClockwiseTwice = "F'2"
    
    case topFlatClockwise = "U"
    case topFlatAntiClockwise = "U'"
    case topFlatClockwiseTwice = "U2"
    case topFlatAntiClockwiseTwice = "U'2"
    
    case leftFlatClockwise = "L"
    case leftFlatAntiClockwise = "L'"
    case leftFlatClockwiseTwice = "L2"
    case leftFlatAntiClockwiseTwice = "L'2"
    
    case rightFlatClockwise = "R"
    case rightFlatAntiClockwise = "R'"
    case rightFlatClockwiseTwice = "R2"
    case rightFlatAntiClockwiseTwice = "R'2"
    
    case bottomFlatClockwise = "B"
    case bottomFlatAntiClockwise = "B'"
    case bottomFlatClockwiseTwice = "B2"
    case bottomFlatAntiClockwiseTwice = "B'2"
    
    case downFlatClockwise = "D"
    case downFlatAntiClockwise = "D'"
    case downFlatClockwiseTwice = "D2"
    case downFlatAntiClockwiseTwice = "D'2"
    
    case bye = "Q"
}
