//
//  Controller.swift
//  UnitTestingSandbox
//
//  Created by John Wakley on 18/11/2014.
//  Copyright (c) 2014 John Wakley. All rights reserved.
//

import Foundation

class Controller {
    func loadView() {
        let tweetRepo = TweetRepository()
        
        // fetch only tweets with the given hashtags
        let tweets = tweetRepo.fetchTweets(["#unittest", "#agile"])
        
        // display filtered tweets
        let view = TweetView(displayTweets: tweets)
        view.render();
    }
}