//
//  NSDateExtension.swift
//  calendar184
//
//  Created by Lin Por on 17/12/19.
//  Copyright © 2019 kantawat. All rights reserved.
//

import Foundation

extension NSDate {
    func isBetweeen(date date1: NSDate, andDate date2: NSDate) -> Bool {
        return date1.compare(self as Date) == self.compare(date2 as Date)
    }
    
}

extension String
{
    func toDateTime() -> NSDate
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        
        return dateFromString
    }
}


