//
//  Extension.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/11.
//

import Foundation

extension String {
    
    var pureString: String {
        return self.removeCharsFromString(arr: ["{", "}", ";", "\""])
    }

    func removeCharsFromString(arr: [String]) -> String {
        var str = self
        for char in arr {
            str = str.replacingOccurrences(of: String(char), with: "")
        }
        return str
    }
}
