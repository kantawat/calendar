//
//  modelClass.swift
//  calendar184
//
//  Created by Yuan Kan on 19/12/19.
//  Copyright © 2019 kantawat. All rights reserved.
//

import Foundation
import  UIKit

class spacialDay{
    var name:String
    var day:Int
    init(name:String,day:Int) {
        self.name=name
        self.day=day
    }
}
class arrSpacialDay{
    var arrSpacialDay:Array<spacialDay>
    var nameMonth:Int
    init(arrSpacialDay:Array<spacialDay>,nameMonth:Int) {
        self.arrSpacialDay = arrSpacialDay
        self.nameMonth = nameMonth
    }
}

class spacialDays{
    static var arrDetailMonth1 = arrSpacialDay.init (arrSpacialDay: [
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)],nameMonth: 1)
    static var arrDetailMonth2 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)],nameMonth: 2)
    static var arrDetailMonth3 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)],nameMonth: 3)
    static var arrDetailMonth4 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)],nameMonth: 4)
    static var arrDetailMonth5 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)],nameMonth: 5)
    static var arrDetailMonth6 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)], nameMonth: 6)
    static var arrDetailMonth7 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)], nameMonth: 7)
    static var arrDetailMonth8 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)], nameMonth: 8)
    static var arrDetailMonth9 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)], nameMonth: 9)
    static var arrDetailMonth10 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)], nameMonth: 10)
    static var arrDetailMonth11 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)], nameMonth: 11)
    static var arrDetailMonth12 = arrSpacialDay.init (arrSpacialDay:[
        spacialDay.init(name: "วันตรุษจีน ,ชุนเจี๋ย (春节zวันตรุษจีน ,ชุนเจี๋ย (春节)", day: 1),
        spacialDay.init(name: "วันไหว้รับเจ้ากลับจากสวรรค์ ไหว้รับเหล่าเอี๊ยเหลาะที ,ซิ้งเลาะที (神下天)", day: 4)], nameMonth: 12)
    
    static func arrDetailMonths() -> Array<arrSpacialDay>{
        return [self.arrDetailMonth1,self.arrDetailMonth2,self.arrDetailMonth3,self.arrDetailMonth4,self.arrDetailMonth5,self.arrDetailMonth6,self.arrDetailMonth7,self.arrDetailMonth8,self.arrDetailMonth9,self.arrDetailMonth10,self.arrDetailMonth11,self.arrDetailMonth12]
    }
    
}
