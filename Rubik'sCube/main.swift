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
//    let myInputInfo = myInput.rubikCubeInput()
//
//    var pushOut = PushOut(word: myInputInfo.0, number: myInputInfo.1, direction: myInputInfo.2)
//    let myPrint = Print()
//    myPrint.printRubiksCube(pushOut.pushOut())
    
    let flatCube = FlatCube()
    let flatCubeActions = myInput.flatCubeInput(initFlatCube: flatCube.groups)
    
}

start()

