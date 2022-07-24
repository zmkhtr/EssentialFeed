//
//  SharedLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by PT.Koanba on 29/06/22.
//

import XCTest
import EssentialFeed

final class SharedLocalizationTests: XCTestCase {
   
    func test_localizedString_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
    
}
