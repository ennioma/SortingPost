//
//  SortingTestsTests.swift
//  SortingTestsTests
//
//  Created by Ennio Masi on 26/09/2017.
//  Copyright © 2017 ennioma. All rights reserved.
//

import XCTest
@testable import SortingTests

class SortingTestsTests: XCTestCase {
    
    var inputArray: [Int] = [100, 1, 2, 0, 50, 23, 22, 21, 10, 101, 0]
    var ascending: [Int] = [0, 0, 1, 2, 10, 21, 22, 23, 50, 100, 101]
    var descending: [Int] = [101, 100, 50, 23, 22, 21, 10, 2, 1, 0, 0]

    // MARK: - Bubble Sort
    func testBubbleSortAscendingWithoutArgs() {
        
        XCTAssertEqual(inputArray.bubbleSort(), ascending)
    }
    
    func testBubbleSortAscending() {
        
        XCTAssertEqual(inputArray.bubbleSort(by: <), ascending)
    }
    
    func testBubbleSortDescending() {
        
        XCTAssertEqual(inputArray.bubbleSort(by: >), descending)
    }
    
    // MARK: - Insertion Sort
    func testInsertionSortAscendingWithoutArgs() {
        
        XCTAssertEqual(inputArray.insertionSort(), ascending)
    }
    
    func testInsertionSortAscending() {
        
        XCTAssertEqual(inputArray.insertionSort(by: <), ascending)
    }
    
    func testInsertionSortDescending() {
        
        XCTAssertEqual(inputArray.insertionSort(by: >), descending)
    }
    
    // MARK: - Selection Sort
    func testSelectionSortAscendingWithoutArgs() {
        
        XCTAssertEqual(inputArray.selectionSort(), ascending)
    }
    
    func testSelectionSortAscending() {
        
        XCTAssertEqual(inputArray.selectionSort(by: <), ascending)
    }
    
    func testSelectionSortDescending() {
        
        XCTAssertEqual(inputArray.selectionSort(by: >), descending)
    }

    // MARK: - Merge Sort
    func testMergeSortAscendingWithoutArgs() {
        
        XCTAssertEqual(inputArray.emMergeSort(), ascending)
    }
    
    func testMergeSortAscending() {
        
        XCTAssertEqual(inputArray.emMergeSort(by: <), ascending)
    }
    
    func testMergeSortDescending() {
        
        XCTAssertEqual(inputArray.emMergeSort(by: >), descending)
    }
    
    // MARK: - Quick Sort
    func testQuickSortAscendingWithoutArgs() {
        
        XCTAssertEqual(inputArray.quickSort(), ascending)
    }
    
    func testQuickSortAscending() {
        
        XCTAssertEqual(inputArray.quickSort(by: <), ascending)
    }
    
    func testQuickSortDescending() {
        
        XCTAssertEqual(inputArray.quickSort(by: >), descending)
    }
    
    // MARK: - Bucket Sort
    func testBucketSortAscendingWithoutArgs() {
        
        XCTAssertEqual(inputArray.bucketSort(), ascending)
    }
    
    func testBucketSortAscending() {
        
        XCTAssertEqual(inputArray.bucketSort(reverse: false), ascending)
    }
    
    func testBucketSortDescending() {
        
        XCTAssertEqual(inputArray.bucketSort(reverse: true), descending)
    }
    
    func testPerformanceExample() {
        var randomArray = (1...5000).map{ _ in arc4random() }
        
        self.measure {
            let data = randomArray.quickSort()
        }
    }
    
}
