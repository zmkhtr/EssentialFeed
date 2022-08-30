//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 05/08/22.
//

import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
