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
        
        XCTAssertEqual(app.cells.count, 22)
        XCTAssertEqual(app.cells.firstMatch.images.count, 1)
    }
}
