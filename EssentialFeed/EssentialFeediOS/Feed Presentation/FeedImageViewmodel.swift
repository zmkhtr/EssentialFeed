//
//  FeedImageViewmodel.swift
//  EssentialFeediOS
//
//  Created by PT.Koanba on 27/02/22.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
