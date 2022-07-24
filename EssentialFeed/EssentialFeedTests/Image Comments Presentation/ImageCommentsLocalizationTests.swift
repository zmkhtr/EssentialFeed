//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by PT.Koanba on 24/07/22.
//

import XCTest
import EssentialFeed

final class ImageCommentsLocalizationTests: XCTestCase {
   
    func test_localizedString_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
}
