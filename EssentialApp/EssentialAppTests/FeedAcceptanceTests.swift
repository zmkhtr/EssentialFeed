//
//  FeedAcceptanceTests.swift
//  EssentialAppTests
//
//  Created by PT.Koanba on 12/06/22.
//

import XCTest
import EssentialFeed
import EssentialFeediOS
@testable import EssentialApp

class FeedAcceptanceTests: XCTestCase {
    
    func test_onLaunch_displaysRemoteFeedWhenCustomerHasConnectivity() {
        let feed = launch(httpClient: .online(response), store: .empty)
        
        XCTAssertEqual(feed.numberOfRenderedFeedImageView(), 2)
        XCTAssertEqual(feed.renderedFeedImageData(at: 0), makeImageData0())
        XCTAssertEqual(feed.renderedFeedImageData(at: 1), makeImageData1())
        XCTAssertTrue(feed.canLoadMoreFeed)
        
        feed.simulateLoadMoreFeedAction()
        
        XCTAssertEqual(feed.numberOfRenderedFeedImageView(), 3)
        XCTAssertEqual(feed.renderedFeedImageData(at: 0), makeImageData0())
        XCTAssertEqual(feed.renderedFeedImageData(at: 1), makeImageData1())
        XCTAssertEqual(feed.renderedFeedImageData(at: 2), makeImageData2())
        XCTAssertTrue(feed.canLoadMoreFeed)
    }
    
    func test_onLaunch_displaysCachedRemoteFeedWhenCustomerHasNoConnectivity() {
        let sharedStore = InMemoryFeedStore.empty
        let onlineFeed = launch(httpClient: .online(response), store: sharedStore)
        onlineFeed.simulateFeedImageViewVisible(at: 0)
        onlineFeed.simulateFeedImageViewVisible(at: 1)
        
        let offlineFeed = launch(httpClient: .offline, store: sharedStore)
        
        XCTAssertEqual(offlineFeed.numberOfRenderedFeedImageView(), 2)
        XCTAssertEqual(offlineFeed.renderedFeedImageData(at: 0), makeImageData0())
        XCTAssertEqual(offlineFeed.renderedFeedImageData(at: 1), makeImageData1())
    }
    
    func test_onLaunch_displayEmptyFeedWhenCustomerHasNoConnectivityAndNoCache() {
        let feed = launch(httpClient: .offline, store: .empty)
        
        XCTAssertEqual(feed.numberOfRenderedFeedImageView(), 0)
    }
    
    func test_onEnteringBackground_deletesExpiredFeedCache() {
        let store = InMemoryFeedStore.withExpiredFeedCache
        
        enterBackground(with: store)
        
        XCTAssertNil(store.feedCache, "Expected to delete expired cache")
    }
    
    func test_onEnteringBackground_keepsNonExpiredFeedCache() {
        let store = InMemoryFeedStore.withNonExpiredFeedCache
        
        enterBackground(with: store)
        
        XCTAssertNotNil(store.feedCache, "Expected to keep non-expired cache")
    }
    
    func test_onFeedImageSelection_displaysComments() {
        let comments = showCommentsForFirstImage()
        
        XCTAssertEqual(comments.numberOfRenderedComments(), 1)
        XCTAssertEqual(comments.commentMessage(at: 0), makeCommentMesasge())
    }
    
    // MARK: - Helpers
    
    private func launch(
        httpClient: HTTPClientStub = .offline,
        store: InMemoryFeedStore = .empty
    ) -> ListViewController {
        let sut = SceneDelegate(httpClient: httpClient, store: store)
        sut.window = UIWindow()
        sut.configureWindow()
        
        let nav = sut.window?.rootViewController as? UINavigationController
        return nav?.topViewController as! ListViewController
    }
    
    private func enterBackground(with store: InMemoryFeedStore) {
        let sut = SceneDelegate(httpClient: HTTPClientStub.offline, store: store)
        sut.sceneWillResignActive(UIApplication.shared.connectedScenes.first!)
    }
    
    private func showCommentsForFirstImage() -> ListViewController {
        let feed = launch(httpClient: .online(response), store: .empty)

        feed.simulateTapOnFeedImage(at: 0)
        RunLoop.current.run(until: Date())

        let nav = feed.navigationController
        return nav?.topViewController as! ListViewController
    }
    
    private func response(for url: URL) -> (Data, HTTPURLResponse) {
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return (makeData(for: url), response)
    }
    
    private func makeData(for url: URL) -> Data {
        switch url.path {
        case "/image-0":
            return makeImageData0()
        case "/image-1":
            return makeImageData1()
        case "/image-2":
            return makeImageData2()
            
        case "/essential-feed/v1/feed" where url.query?.contains("after_id") == false:
            return makeFirstFeedPageData()
            
        case "/essential-feed/v1/feed" where url.query?.contains("after_id=6C9A4772-C13D-4388-8ACA-196DDAD34018") == true:
            return makeSecondFeedPageData()
            
        case "/essential-feed/v1/image/DAC94E31-542E-4BA2-96FD-6A8EF070CFAD/comments":
            return makeCommentsData()
            
        default:
            return Data()
        }
    }
    
    private func makeImageData0() -> Data {  UIImage.make(withColor: .red).pngData()! }
    private func makeImageData1() -> Data {  UIImage.make(withColor: .green).pngData()! }
    private func makeImageData2() -> Data {  UIImage.make(withColor: .blue).pngData()! }


    private func makeFirstFeedPageData() -> Data {
        return try! JSONSerialization.data(withJSONObject: ["items": [
            ["id": "DAC94E31-542E-4BA2-96FD-6A8EF070CFAD", "image": "/image-0"],
            ["id": "6C9A4772-C13D-4388-8ACA-196DDAD34018", "image": "/image-1"]
        ]])
    }
    
    private func makeSecondFeedPageData() -> Data {
        return try! JSONSerialization.data(withJSONObject: ["items": [
            ["id": "166FCDD7-C9F4-420A-B2D6-CE2EAFA3D82F", "image": "/image-2"]
        ]])
    }
    
    private func makeCommentsData() -> Data {
        return try! JSONSerialization.data(withJSONObject: ["items": [
            [
                "id": UUID().uuidString,
                "message": makeCommentMesasge(),
                "created_at": "2020-05-20T11:24:59+0000",
                "author": [
                    "username": "a username"
                ]
            ],
        ]])
    }
    
    private func makeCommentMesasge() -> String {
        "a message"
    }
}
