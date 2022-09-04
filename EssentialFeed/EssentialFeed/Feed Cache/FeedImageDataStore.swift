//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 13/03/22.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
