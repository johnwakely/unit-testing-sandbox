//
//  TweetRepository.swift
//  UnitTestingSandbox
//
//  Created by John Wakley on 20/11/2014.
//  Copyright (c) 2014 John Wakley. All rights reserved.
//

import Foundation

class TweetRepository {
    let connection: ApiConnector;
    
    init() {
        connection = TwitterConnection()
    }
    
    init(twiterConnection: ApiConnector) {
        connection = twiterConnection
    }
    
    func fetchTweets(hashtags: [String]) -> [Tweet] {
        // Request tweets
        let request = "api.twitter.com/tweets"
        let apiResponse = connection.fetchResource(request)
        
        // Parse API response and map to Tweet model objects
        let tweets = parsedApiTweets(apiResponse)
        
        // Filter tweets matching hashtags
        var filteredTweets: [Tweet] = []
        for tweet in tweets {
            var foundAllHastagsForTweet = true
            for hashtag in hashtags {
                if (tweet.hashtags.rangeOfString(hashtag) == nil) {
                    foundAllHastagsForTweet = false
                    break;
                }
            }
            
            if (foundAllHastagsForTweet) {
                filteredTweets.append(tweet)
            }
        }
        
        return filteredTweets
    }
    
    func parsedApiTweets(apiResponse: [[String: String]]) -> [Tweet] {
        var tweets: [Tweet] = []
        
        for item in apiResponse {
            let text = item["body"]
            let hashtags = item["hashtags"]
            let tweet = Tweet(tweetText: text!, tweetHashTags: hashtags!)
            tweets.append(tweet)

        }
        return tweets
    }
}