# SwiftDataStructure
![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg) 
![platforms](https://img.shields.io/badge/platforms-iOS-lightgrey.svg)

Handy data structures and some basic algorithms in Swift

## [Stack](https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID184)
A simple stack implemented by array
* Usage:
~~~swift
let myStack = Stack<Int>()
myStack.push(3)
myStack.push(2)
myStack.push(6)
myStack.printAll() // [3, 2, 6]
myStack.pop()   // 6
myStack.pop()   // 2
myStack.top()   // 3
~~~

## Queue
Use linked-list, enqueue and dequeue both O(1) time
* Usage:
~~~swift
let myQueue = Queue<String>()
myQueue.enqueue("One")
myQueue.enqueue("two")
myQueue.enqueue("three")
myQueue.count()     // 3
myQueue.printAll()  // [One, two, three]
myQueue.dequeue()   // "One"
myQueue.dequeue()   // "two"
myQueue.printAll()  // [three]
~~~

## Heap
A heap implemented by array, get top element in O(1) time, insertion in O(logn) time
* Usage:
~~~swift
let myHeap = Heap<Double>(<) // use (>) is MaxHeap, (<) is MinHeap
myHeap.push(4)
myHeap.push(5)
myHeap.push(2)
myHeap.push(3)
myHeap.push(6)
myHeap.push(1)
myHeap.push(0)
myHeap.printArray() // [0.0, 3.0, 1.0, 5.0, 6.0, 4.0, 2.0]
myHeap.pop()
myHeap.pop()
myHeap.top()	// 2.0
myHeap.pop()
myHeap.printArray() // [3.0, 5.0, 4.0, 6.0]
myHeap.top()	// 3.0
~~~
