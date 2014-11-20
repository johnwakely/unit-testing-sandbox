//
//  TweetRepositoryTests.swift
//  UnitTestingSandbox
//
//  Created by John Wakley on 20/11/2014.
//  Copyright (c) 2014 John Wakley. All rights reserved.
//

import UIKit
import XCTest

class TweetRepositoryTests: XCTestCase {
    
    var stubApiResponse : [[String: String]] = []
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        stubApiResponse = [
            ["body": "Unit testing rocks!", "hashtags": "#unittest #tdd #agile"],
            ["body": "Move fast and break things", "hashtags": "#facebook #quotes"],
            ["body": "Just read the art of unit testing", "hashtags": "#unittest #tdd #agile"]
        ];
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParsedApiTweets_validApiResponse_ReturnsTweetArray() {
        // given
        let repo = TweetRepository()
        
        // when
        let tweets = repo.parsedApiTweets(stubApiResponse)
        
        // then
        let firstTweet = tweets[0]
        XCTAssertTrue(firstTweet.text == "Unit testing rocks!", "Tweet text did not match");
        XCTAssertTrue(firstTweet.hashtags == "#unittest #tdd #agile", "Tweet hasttags did not match");
    }
    
    func testFetchTweets_withHashtag_returnsTweetsMatchingHashtag() {
        // given
        let stubConnection = StubTwitterConnection()
        stubConnection.fakeApiResponse = stubApiResponse
        let repo = TweetRepository(twiterConnection: stubConnection)
        
        // when
        let tweets = repo.fetchTweets(["#unittest", "#agile"])
        
        // then
        XCTAssertTrue(tweets.count == 2, "Expected number of hashtagged tweets not found")
        XCTAssertTrue(tweets[0].text == "Unit testing rocks!", "Invalid tweet");
        XCTAssertTrue(tweets[1].text == "Just read the art of unit testing", "Invalid tweet");
    }
}

