//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by PT.Koanba on 03/03/22.
//

import XCTest
import EssentialFeed

final class FeedLocalizationTests: XCTestCase {
    
    func test_localizedString_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle (for: FeedPresenter.self)
       
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
}
