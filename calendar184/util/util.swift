
import Foundation
import  UIKit
import EventKit


let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

func getEventDay(date:NSDate) -> String{
    var str = ""
    let eventStore = EKEventStore()
    let calendars = eventStore.calendars(for: .event)
    
    for calendar in calendars {
        if calendar.title == ChineseCalendar {
            let date1 = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: date as Date)!
            let date2 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date as Date)!
            
            let predicate = eventStore.predicateForEvents(withStart: date1 , end: date2, calendars: [calendar])
            
            let events = eventStore.events(matching: predicate)
            
            for event in events {
                str +=  " \(event.title ?? "none") \n"
            }
        }
    }
    return str
}

func getEventMonth(date:NSDate) -> monthEventDetail{
    var monthEvent = monthEventDetail(month: "",events: [])
    let eventStore = EKEventStore()
    let calendars = eventStore.calendars(for: .event)
    
    for calendar in calendars {
        if calendar.title == ChineseCalendar {
            
            let months = getdateStrtoformatStr(datestr : date.getMonth())
            let years = date.getYear()
            let calendarx = Calendar.current
            let range = calendarx.range(of: .day, in: .month, for: date as Date)!
            let numDays = range.count
            
            let oneMonthAgo = "01-\(months)-\(years)".toDateTime()
            let oneMonthAfter = "\(numDays)-\(months)-\(years)".toDateTime()
            
            let predicate = eventStore.predicateForEvents(withStart: oneMonthAgo as Date, end: oneMonthAfter as Date, calendars: [calendar])
            
            let events = eventStore.events(matching: predicate)
            
            var eventsDetail:[eventDetail] = []
            for event in events {
                
                let eventDeatail = eventDetail(
                    title: event.title ?? "none",
                    dateFullstr: fullDay(date: event.startDate as NSDate).fulldayStr,
                    date: event.startDate as NSDate)
                eventsDetail.append(eventDeatail)
            }
            monthEvent = monthEventDetail(month: months, events: eventsDetail)
        }
    }
    return monthEvent
}

func getdateStrtoformatStr(datestr: Int) -> String{
    return (String(datestr).count == 1 ? "0" + String(datestr) : String(datestr))
}

func getCurrentMillis(date:Date)->Int64 {
    return Int64(date.timeIntervalSince1970 * 1000)
}



