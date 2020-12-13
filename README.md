# 2021마스터즈코드 1차 테스트

## 1단계: 단어 밀어내기

1. 사용자 입력
Input 구조체의 pushOutInput 함수를 사용하여 사용자 입력으 받는다.
입려 예) apple 3 R / banana 6 L

<pre><code>
let inputArr = readLine() ?? ""
let splitedInputArr = inputArr.components(separatedBy: " ")
let word = splitedInputArr[0]
let number = Int(splitedInputArr[1])
let direction = splitedInputArr[2]

return (word, number ?? 1, direction)
</pre></code>

사용자 입력을 튜플로 리턴한다.

2. 사용자 입려 튜플을 PushOut구조체 파라미터로 넣어 초기화 하여 단어 밀어내기 로직을 실행한다.

```
var pushOut = PushOut(word: myInputInfo.0, number: myInputInfo.1, direction: myInputInfo.2)
```

pushOut메서드는 사용자 입력의 direction가 오른쪽인지,왼쪽인지 판단하여 메서드를 분기한다.

```
mutating func pushOut() -> [String] {
    if self.direction == Direction.upperRight.rawValue || self.direction == Direction.lowerRight.rawValue {
        return rightPushOut()
    } else if self.direction == Direction.upperLeft.rawValue || self.direction == Direction.lowerLeft.rawValue {
        return leftPushOut()
    }
        
    return [String]()
}
```

방향이 R,r이면 rightPushOut 메서드를 리턴하고,

```
private mutating func rightPushOut() -> [String] {
    var emptyStack = Stack(wordStack: [])
    var stack = Stack(wordStack: self.word.map { String($0) })
        
    if self.number < 0 {
        self.number = abs(self.number)
        return leftPushOut()
    }
        
    for _ in 0..<self.number {
        emptyStack.push(stack.pop() ?? "")
        stack.insert(emptyStack.pop() ?? "")
    }
    return stack.wordStack
}
```

방향이 L,l이라면 leftPushOut 메서드를 리턴한다.

```
private mutating func leftPushOut() -> [String] {
    var emptyQueue = Queue(wordQueue: [])
    var queue = Queue(wordQueue: self.word.map { String($0) })
        
    if self.number < 0 {
        self.number = abs(self.number)
        return rightPushOut()
    }
        
    for _ in 0..<self.number {
        emptyQueue.enqueue(queue.dequeue() ?? "")
        queue.enqueue(emptyQueue.dequeue() ?? "")
    }
        
    return queue.wordQueue
}
```

3. 리턴받은 pushOut을 Print구조체를 사용하여 출력한다.

```
myPrint.printLine(pushOut.pushOut())
```

```
func printLine(_ line: [String]) {
    print(line.reduce("", { $0 + $1 }))
}
```


## 2단계: 평면 큐브

1. 평면 큐브르 초기화한다.

```
var flatCube = FlatCube(groups: [["R", "R", "W"], ["G", "C", "W"], ["G", "B", "B"]])
```

2. 사용자 입력을 받는다. 사용자 입력을 받을 때, Print구조체의 initPrintFlatCube메서드를 사용하여 평면큐브 초기 상태르 먼저 출력한다.
```
func flatCubeInput(initFlatCube: [[String]]) -> String {
    let myPrint = Print()
    myPrint.initPrintFlatCube(initFlatCube)
    print("\nCUBE> ", terminator: "")
    let inputString = readLine() ?? ""
        
    return inputString
}
```

3. 초기화한 flatCube 구조체의 move메서드를 사용하여 사용자 입력에 대하 평면 큐브 밀어내기 로직을 수행한다.

```
let myFlatCube = flatCube.move(input: flatCubeActions)
```

makeAction 메서드를 사용하여 사용자 입력을 큐브 밀어내기를 할 수 있느 데이터로 바꾸고, 큐브 밀어내기 데이터에 맞는 pushOut메서드를 수행한다.
```
mutating func move(input: String) -> [resultFlatCube] {
    let actions = makeAction(input)
    var myFlatCube = [flatCube]()
    var resultFlatCube: [resultFlatCube] = []
        
    for action in actions {
        myFlatCube.append(pushOut(action))
    }
        
    resultFlatCube = zip(actions, myFlatCube).map { (key: $0, value: $1) }
        
    return resultFlatCube
}
```

3. pushOut수행을 마친 후 리턴된 평면큐브를 Print구조체를 사용하여 출력한다.

```
myPrint.printFlatCube(myFlatCube)
```

우선, 사용자 입력 데이터를 출력한 후 데이터에 맞게 밀어내기 된 평면 큐브를 출력한다.
```
func printFlatCube(_ flatCubes: [resultFlatCube]) {
    flatCubes.forEach { cubes in
        print(cubes.key)
        for cube in cubes.value {
            for element in cube {
                print(element, terminator: " ")
            }
            print("")
        }
        print("")
    }
}
```

## 3단계: 루빅스 큐브

1. 평면큐브 6개를 사용하여 루빅스 큐브 초기상태를 생성한다.

```
let wFlatCube = FlatCube(groups: [["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]])
let bFlatCube = FlatCube(groups: [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]])
let oFlatCube = FlatCube(groups: [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]])
let gFlatCube = FlatCube(groups: [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]])
let yFlatCube = FlatCube(groups: [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]])
let rFlatCube = FlatCube(groups: [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]])

flatCubeGroups: [bFlatCube.groups, wFlatCube.groups, oFlatCube.groups, gFlatCube.groups, yFlatCube.groups, rFlatCube.groups]

var initRubiksCube = RubiksCube(groups: flatCubeGroups)
```

2. Input 구조체의 rubiksCubeMainInput 메서드를 사용하여 루빅스 큐브 초기상태 출력 및 사용자 입력을 받는다.

```
let myInput = Input()

let inputAction = myInput.rubiksCubeMainInput(initRubiksCube: initRubiksCube)
```

- 루빅스 큐브 사용자 입력을 받는 순서는, 먼저 초기상태를 출력한 후, 사용자입력 카운트를 0으로 초기화 시킨 후 사용자 입력을 받는다.
```
func rubiksCubeMainInput(initRubiksCube: RubiksCube) -> String {
    let myPrint = Print()
    myPrint.initPrintRubiksCube(initRubiksCube)
    UserDefaults.standard.set(0, forKey: UserDefaults.Keys.pushOutCount)
        
    return rubiksCubeInput()
}
```

- 루빅스 큐브 초기상태 출력 메서드
```
func initPrintRubiksCube(_ initRubiksCube: RubiksCube) {
    initRubiksCube.groups.forEach { cubes in
        printRubiksElement(cubes: cubes
    }
}
```

- 사용자 입력이 Q가 아니라면 조작갯수를 사용자 입력수 만큼 추가후 리턴한다.
```
func rubiksCubeInput() -> String {
    print("\nCUBE> ", terminator: "")
    let inputString = readLine() ?? ""
        
    guard inputString == "Q" else {
        let lastPushOutCount = UserDefaults.standard.integer(forKey: UserDefaults.Keys.pushOutCount)
        UserDefaults.standard.set(lastPushOutCount + inputString.count, forKey: UserDefaults.Keys.pushOutCount)
        return inputString
    }
        
    return inputString
}
```

3. RubisCube구조체의 move메서드에 사용자입력을 파라미터로 넣어 로직을 수행한다.
```
let myRubiksCube = initRubiksCube.move(input: inputAction)
```

- move메서드의 처음엔 makeAction메서드르 통하여 사용자입력을 루빅스 큐브를 움직일 수 있는 데이터로 바꾼다
```
mutating func move(input: String) -> [resultRubiksCube] {
    let actions = makeAction(input)
    var myRubiksCube = [rubiksCube]()
    var myResultRubiksCube: [resultRubiksCube] = []
        
    for action in actions {
        myRubiksCube.append(pushOut(action))
    }
        
    myResultRubiksCube = zip(actions, myRubiksCube).map { (key: $0, value: $1) }
    return myResultRubiksCube
}
```

```
private mutating func makeAction(_ input: String) -> [String] {
    let result = input.reduce(into: [String]()) {
        if $1.isUppercase || $0.isEmpty {
            $0.append("\($1)") }
        else {
            $0[$0.count - 1] = $0.last! + "\($1)"
        }
    }
        
    return result
}
```

- 사용자 입력 데이터를 입력한 순서대로 pushOut메서드에 파라미터로 넣으며 초기 루빅스 큐브를 움직인다. 
```
private mutating func pushOut(_ action: String) -> rubiksCube {
    let move = RubiksCubeAction(rawValue: action)
    
    let resultTopFlatClockwise = pushOutTopFlatClockwise([groups[1][0], groups[2][0], groups[3][0], groups[4][0]])
    ...
    ...
    
    switch move {
        case .topFlatClockwise:
            return resultTopFlatClockwise
            ...
            ...
    }
}
```

- 사용자 입력값을 key로 사용자 입력값에 의해 움직여진 루빅스 큐브를 value로 만들어 리턴한다.
```
var myResultRubiksCube: [resultRubiksCube] = []
               
myResultRubiksCube = zip(actions, myRubiksCube).map { (key: $0, value: $1) }
return myResultRubiksCube
```

4. printRubiksCube 메서드를 사용하여 myResultRubiksCube를 출력한다.

- 먼저 lastFlatCubes 변수를 만들고 마지막으로 움직여진 루빅스 큐브를 담아둔다.
- 사용자입력값이 Q라면 조작갯수를 출력하면서 프로그램을 종료시키고, Q가 아니라면 출력 후
- restart메서드를 통해 계속해서 사용자입력을 받는다.

```
func printRubiksCube(myRubiksCubes: [resultRubiksCube], initRubiksCube: RubiksCube) {
    var lastFlatCubes: [flatCube] = []
        
    myRubiksCubes.forEach { myRubiksCube in
        guard myRubiksCube.key != "Q" else {
            print("조작갯수: \(UserDefaults.standard.integer(forKey: UserDefaults.Keys.pushOutCount))")
            print("이용해주셔서 감사합니다. 뚜뚜뚜.")
            return
        }
        print(myRubiksCube.key)
        lastFlatCubes = myRubiksCube.value
            
        myRubiksCube.value.forEach { cubes in
            printRubiksElement(cubes: cubes)
        }
    }
    restart(lastFlatCubes)
}
```
