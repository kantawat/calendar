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
    
    
    func getDays() -> Int {
        let days = Calendar.current.dateComponents([.day], from: self as Date )
        return days.day!
    }
    func getMonth() -> Int {
        let months = Calendar.current.dateComponents([.month], from: self as Date )
        return months.month!
    }
    func getYear() -> Int {
        let years = Calendar.current.dateComponents([.year], from: self as Date )
        return years.year!
    }
    
    func addDays(_ x: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: x, to: self as Date)!
    }
    func addMonth(_ x: Int) -> Date {
        return Calendar.current.date(byAdding: .month, value: x, to: self as Date)!
    }
    func addYear(_ x: Int) -> Date {
        return Calendar.current.date(byAdding: .year, value: x, to: self as Date)!
    }
    func xWeeks(_ x: Int) -> Date {
        return Calendar.current.date(byAdding: .weekOfYear, value: x, to: self as Date)!
    }
   
    
    func toString() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let myString = formatter.string(from: self as Date)
        
        return myString
    }
}



extension String
{
    func toDateTime() -> NSDate
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        
        return dateFromString
    }
}


