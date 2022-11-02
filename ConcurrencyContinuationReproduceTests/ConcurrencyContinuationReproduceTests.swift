//
//  ConcurrencyContinuationReproduceTests.swift
//  ConcurrencyContinuationReproduceTests
//
//  Created by Muukii on 2022/11/03.
//

import XCTest

final class ConcurrencyContinuationReproduceTests: XCTestCase {

  @MainActor
  func testContext() async {
    
    let _: Void = await withCheckedContinuation { c in
      
      XCTAssertTrue(Thread.isMainThread)
      
      c.resume()
    }
    
  }
}
