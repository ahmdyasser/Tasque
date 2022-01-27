//
//  CheckMarkerTests.swift
//  TasqueTests
//
//  Created by Ahmed Ramy on 27/01/2022.
//

import XCTest
@testable import Tasque

class CheckMarkerTests: XCTestCase {
    
    // 1
    var checkmarker: HomeCheckMarkerModel!
    // 2
    override func setUp() {
        checkmarker = .init()
    }
    
    // 3
    override func tearDown() {
        checkmarker = nil
    }
    
    // TODO: - Solve this until next time
    func testCheckMarkingAnItemActuallyMarksItAsDone() {
        // Given (Sets up specific requirements for this case)
        // Create
        // When
        // Actually adding the check mark
        // Then
        // Assert if task.done is true using XCTAssertTrue
    }
    
    // TODO: - Solve this until next time
    func testCheckMarkingADoneItemActuallyMarksItAsNotDone() {
        // Given (Sets up specific requirements for this case)
        // Create an Item
        // Make this item done
        // When
        // Actually adding the check mark
        // Then
        // Assert if task.done is true using XCTAssertTrue
    }
}

/**
 * 1: Creates our SUT (Subject under test), which is the class or piece of logic we want to test via giving it input and output
 * 2. Setup our SUT environment, for now, we are not injecting it with anything, just plain initializer with no parameters
 * 3. Destroys our SUT to ensure a clean-slate every time we run a test (so we don't have any `dirty` data
 */

// TODO: Look up Give, When, Then
// TODO: Look up Unit Test vs Integration Test
// TODO: Look up building UI Cells with XIBs
// TODO: Look up Generics (Suggestion: Look up Generics by Let's Build that app)
