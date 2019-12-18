//
//  dataStatic.swift
//  calendar184
//
//  Created by Lin Por on 18/12/19.
//  Copyright © 2019 kantawat. All rights reserved.
//

import Foundation
import UIKit

class detailMonth{
    var nameMonth:String
    var amountDay:Int
    init(nameMonth:String,amountDay:Int) {
        self.nameMonth=nameMonth
        self.amountDay=amountDay
    }
}

class detailYear{
    var nameYear:String
    var nameThaiYear:String
    var amountMonth:Int
    var amountDays:Int
    var arrDetailMonth:Array<detailMonth>
    init(nameYear:String,nameThaiYear:String,amountMonth:Int,amountDays:Int,arrDetailMonth:Array<detailMonth>) {
        self.nameYear=nameYear
        self.nameThaiYear = nameThaiYear
        self.amountMonth=amountMonth
        self.amountDays=amountDays
        self.arrDetailMonth = arrDetailMonth
    }
}

class chineseCalendar {
    
    static var detailPig = detailYear(nameYear: "Pig",nameThaiYear: "ปีกุน",amountMonth: 12,amountDays: 354,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:30),
        detailMonth.init(nameMonth:"2",amountDay:29),
        detailMonth.init(nameMonth:"3",amountDay:30),
        detailMonth.init(nameMonth:"4",amountDay:29),
        detailMonth.init(nameMonth:"5",amountDay:30),
        detailMonth.init(nameMonth:"6",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:29),
        detailMonth.init(nameMonth:"8",amountDay:30),
        detailMonth.init(nameMonth:"9",amountDay:29),
        detailMonth.init(nameMonth:"10",amountDay:29),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:30)])
    
    static var detailRat = detailYear(nameYear: "rat",nameThaiYear: "ปีชวด",amountMonth: 13,amountDays: 384,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:29),
        detailMonth.init(nameMonth:"2",amountDay:30),
        detailMonth.init(nameMonth:"3",amountDay:30),
        detailMonth.init(nameMonth:"4",amountDay:30),
        detailMonth.init(nameMonth:"44",amountDay:29),
        detailMonth.init(nameMonth:"5",amountDay:30),
        detailMonth.init(nameMonth:"6",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:29),
        detailMonth.init(nameMonth:"8",amountDay:30),
        detailMonth.init(nameMonth:"9",amountDay:29),
        detailMonth.init(nameMonth:"10",amountDay:30),
        detailMonth.init(nameMonth:"11",amountDay:29),
        detailMonth.init(nameMonth:"12",amountDay:30)])
    
    static var detailOx = detailYear(nameYear: "Ox",nameThaiYear: "ปีฉลู",amountMonth: 12,amountDays: 354,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:29),
        detailMonth.init(nameMonth:"2",amountDay:30),
        detailMonth.init(nameMonth:"3",amountDay:30),
        detailMonth.init(nameMonth:"4",amountDay:29),
        detailMonth.init(nameMonth:"5",amountDay:30),
        detailMonth.init(nameMonth:"6",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:30),
        detailMonth.init(nameMonth:"8",amountDay:29),
        detailMonth.init(nameMonth:"9",amountDay:30),
        detailMonth.init(nameMonth:"10",amountDay:29),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:29)])
    
    static var detailTiger = detailYear(nameYear: "Tiger",nameThaiYear: "ปีขาล",amountMonth: 12,amountDays: 355,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:30),
        detailMonth.init(nameMonth:"2",amountDay:29),
        detailMonth.init(nameMonth:"3",amountDay:30),
        detailMonth.init(nameMonth:"4",amountDay:29),
        detailMonth.init(nameMonth:"5",amountDay:30),
        detailMonth.init(nameMonth:"6",amountDay:30),
        detailMonth.init(nameMonth:"7",amountDay:29),
        detailMonth.init(nameMonth:"8",amountDay:30),
        detailMonth.init(nameMonth:"9",amountDay:29),
        detailMonth.init(nameMonth:"10",amountDay:30),
        detailMonth.init(nameMonth:"11",amountDay:29),
        detailMonth.init(nameMonth:"12",amountDay:30)])
    
    static var detailRabbit = detailYear(nameYear: "rabbit",nameThaiYear: "ปีเถาะ",amountMonth: 13,amountDays: 384,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:29),
        detailMonth.init(nameMonth:"2",amountDay:30),
        detailMonth.init(nameMonth:"22",amountDay:29),
        detailMonth.init(nameMonth:"3",amountDay:29),
        detailMonth.init(nameMonth:"4",amountDay:30),
        detailMonth.init(nameMonth:"5",amountDay:30),
        detailMonth.init(nameMonth:"6",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:30),
        detailMonth.init(nameMonth:"8",amountDay:30),
        detailMonth.init(nameMonth:"9",amountDay:29),
        detailMonth.init(nameMonth:"10",amountDay:30),
        detailMonth.init(nameMonth:"11",amountDay:29),
        detailMonth.init(nameMonth:"12",amountDay:30)])
    
    static var detailDragon = detailYear(nameYear: "Dragon",nameThaiYear: "ปีมะโรง",amountMonth: 12,amountDays: 354,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:29),
        detailMonth.init(nameMonth:"2",amountDay:30),
        detailMonth.init(nameMonth:"3",amountDay:29),
        detailMonth.init(nameMonth:"4",amountDay:29),
        detailMonth.init(nameMonth:"5",amountDay:30),
        detailMonth.init(nameMonth:"6",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:30),
        detailMonth.init(nameMonth:"8",amountDay:30),
        detailMonth.init(nameMonth:"9",amountDay:29),
        detailMonth.init(nameMonth:"10",amountDay:30),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:29)])
    
    static var detailSnake = detailYear(nameYear: "Snake",nameThaiYear: "ปีมะเส็ง",amountMonth: 13,amountDays: 384,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:30),
        detailMonth.init(nameMonth:"2",amountDay:29),
        detailMonth.init(nameMonth:"3",amountDay:30),
        detailMonth.init(nameMonth:"4",amountDay:29),
        detailMonth.init(nameMonth:"5",amountDay:29),
        detailMonth.init(nameMonth:"6",amountDay:30),
        detailMonth.init(nameMonth:"66",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:30),
        detailMonth.init(nameMonth:"8",amountDay:29),
        detailMonth.init(nameMonth:"9",amountDay:30),
        detailMonth.init(nameMonth:"10",amountDay:30),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:29)])
    
    static var detailHorse = detailYear(nameYear: "Horse",nameThaiYear: "ปีมะเมีย",amountMonth: 12,amountDays: 354,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:30),
        detailMonth.init(nameMonth:"2",amountDay:29),
        detailMonth.init(nameMonth:"3",amountDay:30),
        detailMonth.init(nameMonth:"4",amountDay:29),
        detailMonth.init(nameMonth:"5",amountDay:29),
        detailMonth.init(nameMonth:"6",amountDay:30),
        detailMonth.init(nameMonth:"7",amountDay:29),
        detailMonth.init(nameMonth:"8",amountDay:29),
        detailMonth.init(nameMonth:"9",amountDay:30),
        detailMonth.init(nameMonth:"10",amountDay:30),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:29)])
    
    static var detailGoat = detailYear(nameYear: "Goat",nameThaiYear: "ปีมะแม",amountMonth: 12,amountDays: 354,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:30),
        detailMonth.init(nameMonth:"2",amountDay:30),
        detailMonth.init(nameMonth:"3",amountDay:29),
        detailMonth.init(nameMonth:"4",amountDay:30),
        detailMonth.init(nameMonth:"5",amountDay:29),
        detailMonth.init(nameMonth:"6",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:30),
        detailMonth.init(nameMonth:"8",amountDay:29),
        detailMonth.init(nameMonth:"9",amountDay:29),
        detailMonth.init(nameMonth:"10",amountDay:30),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:29)])
    
    static var detailMonkey = detailYear(nameYear: "Monkey",nameThaiYear: "ปีวอก",amountMonth: 13,amountDays: 384,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:30),
        detailMonth.init(nameMonth:"2",amountDay:30),
        detailMonth.init(nameMonth:"3",amountDay:30),
        detailMonth.init(nameMonth:"4",amountDay:29),
        detailMonth.init(nameMonth:"5",amountDay:30),
        detailMonth.init(nameMonth:"55",amountDay:29),
        detailMonth.init(nameMonth:"6",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:30),
        detailMonth.init(nameMonth:"8",amountDay:29),
        detailMonth.init(nameMonth:"9",amountDay:29),
        detailMonth.init(nameMonth:"10",amountDay:30),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:29)])
    
    static var detailChiken = detailYear(nameYear: "Chiken",nameThaiYear: "ปีระกา",amountMonth: 12,amountDays: 355,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:30),
        detailMonth.init(nameMonth:"2",amountDay:30),
        detailMonth.init(nameMonth:"3",amountDay:29),
        detailMonth.init(nameMonth:"4",amountDay:30),
        detailMonth.init(nameMonth:"5",amountDay:29),
        detailMonth.init(nameMonth:"6",amountDay:30),
        detailMonth.init(nameMonth:"7",amountDay:29),
        detailMonth.init(nameMonth:"8",amountDay:30),
        detailMonth.init(nameMonth:"9",amountDay:29),
        detailMonth.init(nameMonth:"10",amountDay:29),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:30)])
    
    static var detailDog = detailYear(nameYear: "Dog",nameThaiYear: "ปีจอ",amountMonth: 12,amountDays: 355,arrDetailMonth: [
        detailMonth.init(nameMonth:"1",amountDay:29),
        detailMonth.init(nameMonth:"2",amountDay:30),
        detailMonth.init(nameMonth:"3",amountDay:29),
        detailMonth.init(nameMonth:"4",amountDay:30),
        detailMonth.init(nameMonth:"5",amountDay:30),
        detailMonth.init(nameMonth:"6",amountDay:29),
        detailMonth.init(nameMonth:"7",amountDay:30),
        detailMonth.init(nameMonth:"8",amountDay:29),
        detailMonth.init(nameMonth:"9",amountDay:30),
        detailMonth.init(nameMonth:"10",amountDay:29),
        detailMonth.init(nameMonth:"11",amountDay:30),
        detailMonth.init(nameMonth:"12",amountDay:29)])

    static func detailYears() -> Array<detailYear>{
        return [self.detailPig,self.detailRat,self.detailOx,self.detailTiger,self.detailRabbit,self.detailDragon,self.detailSnake,self.detailHorse,self.detailGoat,self.detailMonkey,self.detailChiken,self.detailDog]
    }


}
