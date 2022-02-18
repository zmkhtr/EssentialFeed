//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 19/12/21.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
