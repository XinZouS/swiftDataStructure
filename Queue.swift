import Foundation

fileprivate class QueueNode<T> {
    
    var val: T
    var next: QueueNode?
    
    init(_ v: T) {
        val = v
    }
}

public class Queue<T> {
    
    private var head: QueueNode<T>?
    private var tail: QueueNode<T>?
    private var size: Int!
    
    public init() {
        self.size = 0
    }
}

extension Queue {
    
    func count() -> Int {
        return size
    }
    
    func enqueue(_ newElement: T) {
        let newNode = QueueNode(newElement)
        if head == nil {
            head = newNode
            size = 1
            if tail == nil {
                tail = head
            }
        } else {
            tail?.next = newNode
            tail = newNode
            size += 1
        }
    }
    
    func dequeue() -> T? {
        guard let currHead = head else { return nil }
        head = currHead.next
        size -= 1
        if head == nil {
            tail = nil
        }
        return currHead.val
    }
    
    func isEmpty() -> Bool {
        return self.size != 0
    }
    
    func headValue() -> T? {
        if let h = head {
            return h.val
        }
        return nil
    }
    
    func tailValue() -> T? {
        if let t = tail {
            return t.val
        }
        return nil
    }
    
    func printAll() {
        var str = ""
        var curr = head
        while curr != nil && curr?.next != nil {
            if let val = curr?.val {
                str += "\(val), "
            }
            curr = curr?.next
        }
        if let t = tail {
            str = "\(str)\(t.val)"
        }
        print("[\(str)]")
    }
}

