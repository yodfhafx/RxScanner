//
//  TodoItem.swift
//  rxScan
//
//  Created by Yodfha on 8/1/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import Foundation


struct TodoItem {
    var title: String
    var deadline: NSDate
    var UUID: String
    
    init(deadline: NSDate, title: String, UUID: String) {
        self.deadline = deadline
        self.title = title
        self.UUID = UUID
    }
    
    var isOverdue: Bool {
        return (NSDate().compare(self.deadline) == NSComparisonResult.OrderedDescending)
        
    }
}
