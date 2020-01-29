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

//<<<<<<< HEAD
class spacialDays{
    static var arrDetailMonth1 = arrSpacialDay.init (arrSpacialDay: [
      
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4),
        spacialDay.init(name: "วันคล้ายวันเกิดเทพเจ้าไฉ่ซิ้งเอี้ย ปางบู๊ ,จ้าวกงหมิง (赵公明)", day: 5),
        spacialDay.init(name: "วันคล้ายวันสมภพองค์เทพยดาฟ้าดิน หยี้วหวังต้าตี้ ,ทีกงแซ (天公生)", day: 9),
        spacialDay.init(name: "วันไหว้เทศกาลชาวนา-เทศกาลโคมไฟ ,ง่วงเซียวโจ่ย (元宵节)", day: 15),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15)],nameMonth: 1)
    static var arrDetailMonth2 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),
        spacialDay.init(name: "วันคล้ายวันประสูติพระโพธิสัตว์กวนอิม", day: 19)],nameMonth: 2)
    static var arrDetailMonth3 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "คล้ายวันประสูติองค์เซวียนเทียนสร้างตี้ ,เฮียงเทียงเสี่ยงตี่ (玄天上帝)", day: 3),
        spacialDay.init(name: "วันเช็งเม้ง (清明节)", day: 12),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),
        spacialDay.init(name: "คล้ายวันประสูติเจ้าแม่ทับทิม ,เทียนโหวเซี้ยบ้อ (天后圣母)", day: 23),],nameMonth: 3)
    static var arrDetailMonth4 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "คล้ายวันประสูติองค์ถานกงต้าเซียนเสิ้ง ,องค์ยุวเทพท่ามกงเยี่ย (谭公爷)", day: 8),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15)],nameMonth: 4)
    static var arrDetailMonth5 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันไหว้บ๊ะจ่าง ,ตวนอู่เจี๋ย (端午节)", day: 5),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),
        ],nameMonth: 5)
    static var arrDetailMonth6 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),
        spacialDay.init(name: "คล้ายวันสำเร็จมรรคผลพระโพธิสัตว์กวนอิม", day: 19),
        spacialDay.init(name: "คล้ายวันประสูติเทพเจ้ากวนอู ,กว้านอี้กง (关羽公)", day: 24),
        ], nameMonth: 6)
    static var arrDetailMonth7 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "คล้ายวันสมภพองค์ไท้สร้างเหลาจวิน (太上老君)", day: 1),
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันสารทจีน ,จงหยวนเจี๋ย (中元节)", day: 15),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),
        spacialDay.init(name: "คล้ายวันเกิดเทพเจ้าไฉ่ซิ้งเอี้ย ปางบุ๋น ,ปี่กาน (比干)", day: 22),
        spacialDay.init(name: "คล้ายวันเกิดเจ้าแม่ลิ้มกอเหนี่ยว", day: 27),], nameMonth: 7)
    static var arrDetailMonth8 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันไหว้พระจันทร์ ,จงชิวเจี๋ย (中秋节)", day: 15),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15)], nameMonth: 8)
    static var arrDetailMonth9 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 1),
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 2),
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 3),
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 4),
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 5),
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 6),
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 7),
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 8),
        spacialDay.init(name: "เทศกาลกินเจ (九皇勝會)", day: 9),
        spacialDay.init(name: "คล้ายวันประสูติเทพเจ้านาจาซาไท้จื้อ (帥元壇中)", day: 9),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),
        spacialDay.init(name: "คล้ายวันออกบวชพระโพธิสัตว์กวนอิม", day: 19)], nameMonth: 9)
    static var arrDetailMonth10 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)s", day: 1),
        spacialDay.init(name: "วัวันพระจีน ,วันจับโหงว (日五十)", day: 15)], nameMonth: 10)
    static var arrDetailMonth11 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันไหว้ขนมบัวลอย ,ตังโจ่ย (冬至)", day: 7),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),], nameMonth: 11)
    static var arrDetailMonth12 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันพระจีน ,วันชิวอิก (日一初)", day: 1),
        spacialDay.init(name: "วันพระจีน ,วันจับโหงว (日五十)", day: 15),
        spacialDay.init(name: "ไหว้ส่งเสด็จเจ้าขึ้นสวรรค์ ,เซ้งเจี่ยที (神上天)", day: 24),
        spacialDay.init(name: "วันไหว้สิ้นปี ,ก๊วยนี้โจ่ย (过年)", day: 30),
        spacialDay.init(name: "วันไหว้รับเสด็จเทพเจ้าแห่งโชคลาภไฉ่ซิ้งเอี้ย (财神爷)", day: 30),], nameMonth: 12)
    
    static func arrDetailMonths() -> Array<arrSpacialDay>{
        return [self.arrDetailMonth1,self.arrDetailMonth2,self.arrDetailMonth3,self.arrDetailMonth4,self.arrDetailMonth5,self.arrDetailMonth6,self.arrDetailMonth7,self.arrDetailMonth8,self.arrDetailMonth9,self.arrDetailMonth10,self.arrDetailMonth11,self.arrDetailMonth12]
=======
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
>>>>>>> 3466fa9f439da93dbd4e2831d845eb68011aec7e
    }
}
}


