//
//  Item.swift
//  Tasque
//
//  Created by Ahmad Yasser on 09/01/2022.
//

import Foundation

class Item: NSObject, Codable {
    var title: String
    var done: Bool
    var date: Date
    
    init(title: String, done: Bool, date: Date) {
        self.title = title
        self.done = done
        self.date = date
    }
}
