//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 23/03/22.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
