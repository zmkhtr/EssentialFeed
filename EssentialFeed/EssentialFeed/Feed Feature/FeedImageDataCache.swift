//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 23/03/22.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
