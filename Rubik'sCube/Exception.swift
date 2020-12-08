//
//  Exception.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/07.
//

import Foundation

import Foundation

enum ExceptionType: Error {
    case minimumNumber
    case maximumNumber
}

struct Exception {
    func precondition(number condition: Int) throws {
        switch condition {
        case ...(-101):
            throw ExceptionType.minimumNumber
        case 100...:
            throw ExceptionType.maximumNumber
        default:
            break
        }
    }
}
