//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 16/01/22.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletions = (Error?) -> Void
    typealias RetrievalCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletions)
    func retrieve(completion: @escaping RetrievalCompletion)
}
