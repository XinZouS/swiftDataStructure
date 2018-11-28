import Foundation

/*
 * ref: https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID184
 */

struct Stack<Element> {
    
    private var arr: [Element] = []
    
    mutating func push(_ newElement: Element) {
        arr.append(newElement)
    }
    
    mutating func pop() -> Element? {
        if arr.count == 0 { return nil }
        let last = arr.last
        arr.removeLast()
        return last
    }
    
    mutating func removeAll() {
        arr.removeAll()
    }
    
    func isEmpty() -> Bool {
        return arr.count == 0
    }
    
    func top() -> Element? {
        return arr.last
    }
    
    func count() -> Int {
        return arr.count
    }
    
}
