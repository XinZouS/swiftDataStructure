import Foundation

/*
 * ref: https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID184
 */

public class Stack<Element> {
    
    fileprivate var arr: [Element] = []
    
    func push(_ newElement: Element) {
        arr.append(newElement)
    }
    
    func pop() -> Element? {
        if arr.count == 0 { return nil }
        let last = arr.last
        arr.removeLast()
        return last
    }
}

extension Stack {
    
    func top() -> Element? {
        return arr.last
    }
    
    func removeAll() {
        arr.removeAll()
    }
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
    
    func count() -> Int {
        return arr.count
    }
    
    func printAll() {
        var str = ""
        for (i,n) in arr.enumerated() {
            if i == 0 {
                str = "\(n)"
            } else {
                str = "\(str), \(n)"
            }
        }
        print("[\(str)]")
    }
    
}
