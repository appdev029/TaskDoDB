//
//  TaskDoTests.swift
//  TaskDoTests
//
//  Created by Rai on 7/20/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import XCTest
@testable import TaskDo


class TaskDoTests: XCTestCase {

    var task: Task!

    override func setUp() {
        task = Task(task: "")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        task = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testObjectIsCreated() {
      // 1. given

      // 2. when

      // 3. then
      XCTAssertEqual(task.name, "", "Assigned value is wrong")
    }


}
