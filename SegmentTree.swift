import Foundation


public class SegmentTreeNode {
    var maxIdx: Int = 0
    var minIdx: Int = 0
    var maxBound: Int = 0
    var minBound: Int = 0
    var left: SegmentTreeNode?
    var right: SegmentTreeNode?
    
    init(_ minI: Int, _ maxI: Int, _ minB: Int, _ maxB: Int) {
        maxIdx = maxI
        minIdx = minI
        maxBound = maxB
        minBound = minB
        left = nil
        right = nil
    }
}

public class SegmentTree<T: Comparable> {
    
    var root: SegmentTreeNode?
    
    /// array only accept numerical type
    private var nums: [T]
    
    init(_ nums: [T]) {
        self.nums = nums
        if nums.count > 0 {
            self.root = setupSegmentTree(0, nums.count - 1)
        } else {
            print("[ERROR] your array must contant at least 1 element")
        }
    }
}

extension SegmentTree {
    
    /// construct segment tree by the given array, which should NOT be empty
    fileprivate func setupSegmentTree(_ start: Int, _ end: Int) -> SegmentTreeNode? {
        if start > end || start >= self.nums.count { return nil }
        if start == end {
            return SegmentTreeNode(start, start, start, start)
        }
        
        let mid = start + (end - start) / 2
        let left = setupSegmentTree(start, mid)
        let right = setupSegmentTree(mid + 1, end)
        
        if let l = left, let r = right {
            if l.maxIdx >= self.nums.count || r.maxIdx >= self.nums.count {
                print("[ERROR] index out of range(0-\(self.nums.count)): l.maxIdx=\(l.maxIdx), r.maxIdx=\(r.maxIdx), failed to construct tree node for range: \(start)--\(end)")
                return nil
            }
            let rootMax = (nums[l.maxIdx] > nums[r.maxIdx] ? l.maxIdx : r.maxIdx)
            let rootMin = (nums[l.minIdx] < nums[r.minIdx] ? l.minIdx : r.minIdx)
            let root = SegmentTreeNode(rootMin, rootMax, start, end)
            root.left = l
            root.right = r
            return root
        }
        print("[ERROR] setupSegmentTree() unable to unwarp node[\(start),\(end)] left=\(left) or right=\(right), abort...")
        return nil
    }
    
    
    /// find the index of target value in section, default is Max(>)
    func findTargetIndex(start: Int, end: Int, compair: (_ a: T, _ b: T) -> Bool) -> Int {
        return find(start, end, self.root, compair)
    }
    
    /// find the value of target in section, for cases that have no access to the array
    func findTargetValue(start: Int, end: Int, compair: (_ a: T, _ b: T) -> Bool) -> T? {
        let idx = find(start, end, self.root, compair)
        return idx == -1 ? nil : nums[idx]
    }
    
    /// helper to do the searching process
    private func find(_ str: Int, _ end: Int, _ root: SegmentTreeNode?, _ cmp: (_ a: T, _ b: T) -> Bool) -> Int {
        if str > end || str >= nums.count || end < 0 { return -1 }
        guard let rt = root else { return -1 }
        
        let maxV = nums[rt.maxIdx]
        let minV = nums[rt.minIdx]
        let targetIdx = cmp(maxV, minV) ? rt.maxIdx : rt.minIdx
        
        guard let left = rt.left, let right = rt.right else { return targetIdx }
        
        if rt.minBound <= str && end <= rt.maxBound {
            if str == rt.minBound && end == rt.maxBound { // [----~~~~]
                let targetMax = nums[rt.maxIdx]
                let targetMin = nums[rt.minIdx]
                return cmp(targetMax, targetMin) ? rt.maxIdx : rt.minIdx
                
            } else if end <= left.maxBound { // [---]-~~~~
                return find(str, end, left, cmp)
                
            } else if str >= right.minBound { // ----~[~~~]
                return find(str, end, right, cmp)
                
            } else { // --[--~~]~~
                let idxL = find(str, left.maxBound, left, cmp)
                let idxR = find(right.minBound, end, right, cmp)
                let targetL = nums[idxL]
                let targetR = nums[idxR]
                return cmp(targetL, targetR) ? idxL : idxR
            }
        }
        // else the input bound is out of range, reset it to the edge
        return find(rt.minBound, rt.maxBound, rt, cmp)
    }
}


