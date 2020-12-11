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
    let myPrint = Print()
    
    //MARK:- 단어 밀어내기
    /*
    let myInputInfo = myInput.rubikCubeInput()
    var pushOut = PushOut(word: myInputInfo.0, number: myInputInfo.1, direction: myInputInfo.2)
    myPrint.printLine(pushOut.pushOut())
     */
    
    
    //MARK:- 평면 큐브
    /*
    var flatCube = FlatCube(groups: [["R", "R", "W"], ["G", "C", "W"], ["G", "B", "B"]])
    let flatCubeActions = myInput.flatCubeInput(initFlatCube: flatCube.groups)
    let myFlatCube = flatCube.move(input: flatCubeActions)
    myPrint.printFlatCube(myFlatCube)
    */
    
    //MARK:- 루빅스 큐브
    let wFlatCube = FlatCube(groups: [["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]])
    let bFlatCube = FlatCube(groups: [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]])
    let oFlatCube = FlatCube(groups: [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]])
    let gFlatCube = FlatCube(groups: [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]])
    let yFlatCube = FlatCube(groups: [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]])
    let rFlatCube = FlatCube(groups: [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]])
    
    var rubiksCube = RubiksCube(groups: [bFlatCube.groups, wFlatCube.groups, oFlatCube.groups, gFlatCube.groups, yFlatCube.groups, rFlatCube.groups,])
    let rubiksCubeActions = myInput.rubiksCubeInput(initRubiksCube: rubiksCube)
    let myRubiksCube = rubiksCube.move(input: rubiksCubeActions)
    myPrint.printRubiksCube(myRubiksCubes: myRubiksCube, initRubiksCube: rubiksCube)
}

start()

