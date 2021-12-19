//
//  RemoteFeedLoaderTests.swift
//  RemoteFeedLoaderTests
//
//  Created by PT.Koanba on 19/12/21.
//

import XCTest

class RemoteFeedLoader {
    func load(){
//        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
//    static let shared = HTTPClient()
    static var shared = HTTPClient()
    
//    private init() {}
    
    func get(from url : URL) {}
}

class HTTPClientSpy: HTTPClient {
    override func get(from url : URL){
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
//        let client = HTTPClient.shared
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
//        Depedency Injection
//        let sut = RemoteFeedLoader(client: client) -> constructor injection
//        sut.client = client -> property injection
//        sut.load(client: cilent) -> method injection
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
