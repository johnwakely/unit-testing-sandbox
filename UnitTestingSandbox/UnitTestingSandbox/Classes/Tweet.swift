//
//  Tweet.swift
//  UnitTestingSandbox
//
//  Created by John Wakley on 18/11/2014.
//  Copyright (c) 2014 John Wakley. All rights reserved.
//

import Foundation

class Tweet {
    var text: String
    var hashtags: String
    
    init(tweetText: String, tweetHashTags: String) {
        text = tweetText
        hashtags = tweetHashTags
    }
}