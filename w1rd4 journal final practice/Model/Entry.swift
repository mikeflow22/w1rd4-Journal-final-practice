//
//  Entry.swift
//  w1rd4 journal final practice
//
//  Created by Michael Flowers on 1/25/18.
//  Copyright © 2018 Michael Flowers. All rights reserved.
//

import Foundation

class Entry : Equatable , Codable {
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText && lhs.timeStamp == rhs.timeStamp
    }
    
    var title: String
    var bodyText: String
    var timeStamp: Date
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = Date()
    }
}
