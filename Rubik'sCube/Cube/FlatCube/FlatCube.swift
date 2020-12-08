//
//  FlatCube.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/08.
//

import Foundation

typealias plane = String

struct FlatCube {
    private(set) var groups: [[plane]] = [["R", "R", "W"], ["G", "C", "W"], ["G", "B", "B"]]
    private(set) var actions = [String]()
}
