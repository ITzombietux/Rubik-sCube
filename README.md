# 2021마스터즈코드 1차 테스트

## 1단계: 단어 밀어내기

1. 사용자 입력
Input 구조체의 pushOutInput 함수를 사용하여 사용자 입력으 받는다.
입려 예) apple 3 R / banana 6 L

```
let inputArr = readLine() ?? ""
let splitedInputArr = inputArr.components(separatedBy: " ")
let word = splitedInputArr[0]
let number = Int(splitedInputArr[1])
let direction = splitedInputArr[2]

return (word, number ?? 1, direction)
```
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
