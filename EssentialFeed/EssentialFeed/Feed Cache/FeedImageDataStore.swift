//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 13/03/22.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
