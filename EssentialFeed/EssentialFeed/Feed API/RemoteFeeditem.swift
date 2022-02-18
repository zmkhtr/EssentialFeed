//
//  RemoteFeeditem.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 16/01/22.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
