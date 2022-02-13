//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 13/02/22.
//

import Foundation

public final class CoreDataFeedStore: FeedStore {
    public init() {}
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletions) {
        
    }
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {

    }
    
}
