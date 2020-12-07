//
//  main.swift
//  Rubik'sCube
//
//  Created by zombietux on 2020/12/07.
//

import Foundation

//메인 함수
func start() {
    let myInput = Input()
    let myInputInfo = myInput.input()
    
    let pushOut = PushOut(word: myInputInfo.0, number: myInputInfo.1, direction: myInputInfo.2)
    pushOut.pushOut()
}

//사다리게임 시작.
start()

