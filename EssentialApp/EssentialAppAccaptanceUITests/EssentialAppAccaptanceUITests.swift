//
//  EssentialAppAccaptanceUITests.swift
//  EssentialAppAccaptanceUITests
//
//  Created by PT.Koanba on 12/06/22.
//

import XCTest

class EssentialAppAccaptanceUITests: XCTestCase {

    func test_onLaunch_displaysRemoteFeedWhenCustomerHasConnectivity() {
        let app = XCUIApplication()
        
        app.launch()
        
        let feedCells = app.cells.matching(identifier: "feed-image-cell")
        XCTAssertEqual(feedCells.count, 22)
        
        let firstImage = app.images.matching(identifier: "feed-image-view").firstMatch
        XCTAssertTrue(firstImage.exists)
    }
}
