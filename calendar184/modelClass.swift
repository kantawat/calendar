//
//  modelClass.swift
//  calendar184
//
//  Created by Yuan Kan on 19/12/19.
//  Copyright © 2019 kantawat. All rights reserved.
//

import Foundation
import  UIKit



var initDate = "05-02-2019"
var initDay =  NSDate()
var ChineseCalendar = "ChineseCalendar" //ChineseCalendar

class spacialDayFire : NSObject {
    var name:String
    var dayChinese:Int
    var monthChinese:Int
    init(dict: [String: AnyObject]) {
        dayChinese = dict["dayChinese"] as! Int
        name = dict["name"] as! String
        monthChinese = dict["monthChinese"] as! Int
    }
}

class DetailMonth : NSObject {
    var nameMonth:String
    var amountDay:Int
    init(dict: [String: AnyObject]) {
        nameMonth = dict["nameMonth"] as! String
        amountDay = dict["amountDay"] as! Int
    }
}
class chineseCalendarFire : NSObject {
    var nameYear:String
    var nameThaiYear:String
    var amountMonth:Int
    var amountDays:Int
    var startDate:String
    var endDate:String
    var detailMonths:[DetailMonth]
    init(dict: [String: AnyObject]) {
        nameYear = dict["nameYear"] as! String
        nameThaiYear = dict["nameThaiYear"] as! String
        amountMonth = dict["amountMonth"] as! Int
        amountDays = dict["amountDays"] as! Int
        startDate = dict["startDate"] as! String
        endDate = dict["endDate"] as! String
        
        var list = [DetailMonth]()
        let enumerator =  dict["detailMonth"] as! NSArray
        for x in enumerator{
            let detailMonth = DetailMonth(dict: x as! [String : AnyObject])
            list.append(detailMonth)
        }
        detailMonths = list
    }
}

class chineseYearCalendarFire : NSObject {
    var nameYear:String
    var nameThaiYear:String
    var amountMonth:Int
    var amountDays:Int
    var startDate:String
    var endDate:String
    init(dict: [String: AnyObject]) {
        nameYear = dict["nameYear"] as! String
        nameThaiYear = dict["nameThaiYear"] as! String
        amountMonth = dict["amountMonth"] as! Int
        amountDays = dict["amountDays"] as! Int
        startDate = dict["startDate"] as! String
        endDate = dict["endDate"] as! String
    }
}


