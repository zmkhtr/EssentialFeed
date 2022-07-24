//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 10/03/22.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}

