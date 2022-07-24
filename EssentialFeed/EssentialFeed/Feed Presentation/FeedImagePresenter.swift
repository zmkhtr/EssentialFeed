//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by PT.Koanba on 10/03/22.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
