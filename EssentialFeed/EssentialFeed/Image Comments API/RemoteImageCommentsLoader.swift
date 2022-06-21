//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 17/06/22.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
