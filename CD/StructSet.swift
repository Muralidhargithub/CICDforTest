//
//  StructSet.swift
//  CD
//
//  Created by Muralidhar reddy Kakanuru on 1/20/25.
//

import Foundation


struct StructSet<T: Comparable> {
    var elements: [T] = []

    func mergeSort(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex...]))
        return merge(leftArray, rightArray)
    }

    func merge(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var sortedArray: [T] = []
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                sortedArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                sortedArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        if leftIndex < left.count { sortedArray.append(contentsOf: left[leftIndex...]) }
        if rightIndex < right.count { sortedArray.append(contentsOf: right[rightIndex...]) }
        return sortedArray
    }

    mutating func addElement(_ element: T) {
        if !elements.contains(element) {
            elements.append(element)
            elements = mergeSort(elements)
        }
    }

    mutating func addElements(_ arrElements: [T]) {
        for i in arrElements { addElement(i) }
    }

    mutating func removeValue(_ value: T) {
        if let findIndex = elements.firstIndex(of: value) {
            elements.remove(at: findIndex)
        }
    }

    mutating func removeValueAt(_ index: Int) {
        elements.remove(at: index)
    }

    mutating func maxArrayEle() -> T? {
        return elements.max()
    }

    mutating func minArrayEle() -> T? {
        return elements.min()
    }
}

//destination: "platform=iOS Simulator,name=iPhone 15 Pro,OS=17.0",
