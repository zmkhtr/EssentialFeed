//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by PT.Koanba on 22/02/22.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
