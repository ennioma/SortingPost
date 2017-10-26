//
//  Sorting.swift
//  SortingTests
//
//  Created by Ennio Masi on 26/09/2017.
//  Copyright © 2017 ennioma. All rights reserved.
//

func swap<T: Comparable>(left: inout T, right: inout T) {
    print("Swapping \(left) and \(right)")
    let temp = right
    right = left
    left = temp
}

import Foundation

extension Array where Element: Comparable {
    
    func bubbleSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) {
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) {
                data.swapAt(j, j + 1)
            }
        }
        
        return data
    }
    
    func insertionSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        
        var data = self
        
        for i in 1..<data.count {
            let key = data[i]
            var j = i - 1
            
            while j >= 0 && areInIncreasingOrder(key, data[j]) {
                data[j+1] = data[j]
                
                j = j - 1
            }
            
            data[j + 1] = key
        }
        
        return data
    }
    
    func selectionSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) {
            var currentMin = i
            
            for j in i+1..<data.count where areInIncreasingOrder(data[j], data[currentMin]) {
                currentMin = j
            }
            
            guard i != currentMin else { continue }
            
            data.swapAt(i, currentMin)
        }
        
        return data
    }
    
    private func _quickSort(_ array: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool)) -> [Element] {
        if array.isEmpty { return array }
        
        var data = array
        
        let pivot = data.remove(at: 0)
        let left = data.filter { areInIncreasingOrder($0, pivot) }
        let right = data.filter { !areInIncreasingOrder($0, pivot) }
        let middle = [pivot]
        
        return _quickSort(left, by: areInIncreasingOrder) + middle + _quickSort(right, by: areInIncreasingOrder)
    }
    
    func quickSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        return _quickSort(self, by: areInIncreasingOrder)
    }
    
    private func merge(left: [Element], right: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var output: [Element] = []
        
        var mutableLeft = left
        var mutableRight = right
        while mutableLeft.count > 0 && mutableRight.count > 0 {
            
            if let firstElement = mutableLeft.first, let secondElement = mutableRight.first {
                
                if !areInIncreasingOrder(firstElement, secondElement) {
                    output.append(secondElement)
                    mutableRight.remove(at: 0)
                } else {
                    output.append(firstElement)
                    mutableLeft.remove(at: 0)
                }
            }
        }
        
        output.append(contentsOf: mutableLeft)
        output.append(contentsOf: mutableRight)
        
        return output
    }
     
    private func _emMergeSort(data: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        if data.count < 2 { return data }
        
        let leftArray = Array(data[..<Int(data.count / 2)])
        let rightArray = Array(data[Int(data.count / 2)..<data.count])

        return merge(left: _emMergeSort(data: leftArray, by: areInIncreasingOrder), right: _emMergeSort(data: rightArray, by: areInIncreasingOrder), by: areInIncreasingOrder)
    }
    
    func emMergeSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        let data = self
        
        return _emMergeSort(data: data, by: areInIncreasingOrder)
    }
    
}

extension Array where Element == Int {
    func bucketSort(reverse: Bool = false) -> [Element] {
        var data = self
        
        guard data.count > 0 else { return [] }
        
        let max = data.max()!
        var buckets = [Int](repeating: 0, count: (max + 1))
        var out = [Int]()
        
        for i in 0..<data.count {
            buckets[data[i]] = buckets[data[i]] + 1
        }

        buckets.enumerated().forEach { index, value in
            guard value > 0 else { return }
            
            out.append(contentsOf: [Int](repeating: index, count: value))
        }

        return reverse == true ? out.reversed() : out
    }
}
