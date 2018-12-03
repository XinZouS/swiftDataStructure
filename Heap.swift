import Foundation


public class Heap<T: Comparable> {
    
    fileprivate var nums: [T]
    fileprivate var compair: (_ a: T, _ b: T) -> Bool
    
    /// Define a MaxHeap or MinHeap by passing > or < into compairMethod
    init(_ compairMethod: @escaping (_ a: T, _ b: T) -> Bool ) {
        self.compair = compairMethod
        self.nums = []
    }
}

/// Main functions
extension Heap {
    
    func push(_ val: T) {
        nums.append(val)
        heapifyBottomUp()
    }
    
    func pop() {
        if nums.count == 0 { return }
        if nums.count <= 2 {
            nums.removeFirst()
            return
        }
        swapAtIndex(0, nums.count - 1)
        nums.removeLast()
        heapifyTopDown()
    }
    
    func top() -> T? {
        if let t = nums.first {
            return t
        }
        return nil
    }
    
    func count() -> Int {
        return nums.count
    }
    
    func isEmpty() -> Bool {
        return nums.isEmpty
    }
    
    func printArray() {
        var str = ""
        for (i,n) in nums.enumerated() {
            if i == 0 {
                str = "\(n)"
            } else {
                str = "\(str), \(n)"
            }
        }
        print("[\(str)]")
    }
}

/// Helpers
extension Heap {
    
    fileprivate func heapifyTopDown() {
        var curr = 0
        while curr < nums.count {
            let l = curr * 2 + 1
            let r = curr * 2 + 2
            if l >= nums.count { return }
            if l == nums.count - 1, !compair(nums[curr], nums[l]) {
                swapAtIndex(curr, l)
                return
            }
            if r >= nums.count { return }
            
            if compair(nums[l], nums[r]) {
                swapAtIndex(curr, l)
                curr = l
            } else {
                swapAtIndex(curr, r)
                curr = r
            }
        }
    }
    
    fileprivate func heapifyBottomUp() {
        var curr = nums.count - 1
        while curr > 0 {
            let parent = (curr - 1) / 2
            if !compair(nums[parent], nums[curr]) {
                swapAtIndex(parent, curr)
            } else {
                return
            }
            curr = parent
        }
    }
    
    fileprivate func swapAtIndex(_ a: Int, _ b: Int) {
        if a >= 0 && b >= 0 && a < nums.count && b < nums.count {
            let tmp = nums[a]
            nums[a] = nums[b]
            nums[b] = tmp
        }
    }
}

