

import Foundation
import  UIKit



var initDate = "05-02-2019"
var searchMap = ""
var initDay =  NSDate()
var ChineseCalendar = "ChineseCalendar" //ChineseCalendar
var spacialDayList = [spacialDayFire]()
var chineseCalendarList = [chineseCalendarFire]()
var begList = [Beg]()
var notLikeList = [NotLike]()
var goodOrBadList = [GoodOrBad]()

class spacialDayFire : NSObject {
    var name:String
    var dayChinese:Int
    var detail:[Int]
    var monthChinese:Int
    init(dict: [String: AnyObject]) {
        dayChinese = dict["dayChinese"] as! Int
        name = dict["name"] as! String
        monthChinese = dict["monthChinese"] as! Int
        
        var list = [Int]()
        if((dict["detail"]) != nil){
            let enumerator =  dict["detail"] as! NSArray
            for x in enumerator{
                list.append(x as! Int)
            }
            
        }
        detail = list
        
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

class Beg : NSObject {
    var name:String
    var details:[BegDetail]
    init(dict: [String: AnyObject]) {
        name = dict["name"] as! String
        
        var list = [BegDetail]()
        let enumerator =  dict["detail"] as! NSArray
        for x in enumerator{
            let beglist = BegDetail(dict: x as! [String : AnyObject])
            list.append(beglist)
        }
        details = list
    }
}
class BegDetail : NSObject {
    var name:String
    var list:[Beglist]
    init(dict: [String: AnyObject]) {
        name = dict["name"] as! String
        
        var list = [Beglist]()
        let enumerator =  dict["list"] as! NSArray
        for x in enumerator{
            let beglist = Beglist(dict: x as! [String : AnyObject])
            list.append(beglist)
        }
        self.list = list
    }
}
class Beglist : NSObject {
    var name:String
    var img:String
    init(dict: [String: AnyObject]) {
        name = dict["name"] as! String
        img = dict["img"] as! String
    }
}

class GoodOrBad : NSObject {
    var name:String
    var type:String
    init(dict: [String: AnyObject]) {
        name = dict["name"] as! String
        type = dict["type"] as! String
    }
}
class NotLike : NSObject {
    var year1:NotLikeYear
    var year2:NotLikeYear
    init(dict: [String: AnyObject]) {
        year1 = NotLikeYear(dict: dict["year1"] as! [String : AnyObject])
        year2 = NotLikeYear(dict: dict["year2"] as! [String : AnyObject])
    }
}

class NotLikeYear : NSObject {
    var nameEng:String
    var nameThai:String
    init(dict: [String: AnyObject]) {
        nameEng = dict["nameEng"] as! String
        nameThai = dict["nameThai"] as! String
    }
}
