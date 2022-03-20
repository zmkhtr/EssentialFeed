//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 20/03/22.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void )
}
