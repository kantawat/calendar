//
//  ViewController.swift
//  calendar184
//
//  Created by Lin Por on 10/12/19.
//  Copyright © 2019 kantawat. All rights reserved.
//
//test git

import UIKit
import KDCalendar
import Firebase
import PopupDialog
import EventKit

class ViewController: UIViewController , CalendarViewDataSource , CalendarViewDelegate{
    
    var thisMonth = 0
    var spacialDayList = [spacialDayFire]()
    var chineseCalendarList = [chineseCalendarFire]()
    var ref: DatabaseReference!
    @IBOutlet weak var showTitle: UILabel!
    
    @IBOutlet weak var calendarView: CalendarView!
    var refDatabase: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let style = CalendarView.Style()
        
        
        style.cellShape                = .bevel(8.0)
        style.cellColorDefault         = UIColor.clear
        style.cellColorToday           = UIColor(red:1.00, green:0.84, blue:0.64, alpha:1.00)
        style.cellSelectedBorderColor  = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.cellEventColor           = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.headerTextColor          = UIColor.gray
        
        style.cellTextColorDefault     = UIColor(red: 249/255, green: 180/255, blue: 139/255, alpha: 1.0)
        style.cellTextColorToday       = UIColor.orange
        style.cellTextColorWeekend     = UIColor(red: 237/255, green: 103/255, blue: 73/255, alpha: 1.0)
        style.cellColorOutOfRange      = UIColor(red: 249/255, green: 226/255, blue: 212/255, alpha: 1.0)
        
        style.headerBackgroundColor    = UIColor.white
        style.weekdaysBackgroundColor  = UIColor.white
        style.firstWeekday             = .sunday
        
        style.locale                   = Locale(identifier: "en_US")
        
        style.timeZone                 = TimeZone(abbreviation: "UTC")!
        
        style.cellFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.headerFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.weekdaysFont = UIFont(name: "Helvetica", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        
        calendarView.style = style
        
        calendarView.dataSource = self
        
        calendarView.delegate = self
        
        calendarView.direction = .horizontal
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
        
        
        calendarView.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1.0)
        
        self.ref = Database.database().reference()
        awaitFuncChineseCalendar { (Bool) in
            if(Bool){
                for yeardetail in self.chineseCalendarList {

                        var initDateYear = yeardetail.startDate.toDateTime()
                        for monthdetail in yeardetail.detailMonths {

                            let arrspacialDay = self.spacialDayList.filter {
                                ($0 ).monthChinese == Int(monthdetail.nameMonth)
                                }

                                if !arrspacialDay.isEmpty{
                                    for v in arrspacialDay{
                                        let date = initDateYear.addDays(v.dayChinese) as NSDate
                                        self.calendarView.addEvent(calendar: ChineseCalendar,v.name, date: date as Date)
                                    }
                                    initDateYear = initDateYear.addDays(monthdetail.amountDay) as NSDate

                                }

                        }

                }
            }
        }
        
        
    }
    
    func awaitFuncSpacialDay(completion: @escaping (_ success: Bool) -> Void) {
        var itemlist = [spacialDayFire]()
        self.ref.child("spacialDay").observeSingleEvent(of: .value, with: { (snapshot) in
            //            group.enter()
            
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? DataSnapshot {
                let newModel = spacialDayFire(dict: rest.value as! [String : AnyObject])
                itemlist.append(newModel)
            }
            
            self.spacialDayList = itemlist
            completion(true)
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    func awaitFuncChineseCalendar(completion: @escaping (_ success: Bool) -> Void) {
        awaitFuncSpacialDay { (Bool) in
            if(Bool){
                var itemlist = [chineseCalendarFire]()
                self.ref.child("chineseCalendar").child(initDate).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    let enumerator = snapshot.children
                    while let rest = enumerator.nextObject() as? DataSnapshot {
                        let newModel = chineseCalendarFire(dict: rest.value as! [String : AnyObject])
                        itemlist.append(newModel)
                    }
                    self.chineseCalendarList = itemlist
                    completion(true)
                }) { (error) in
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func listShow(_ sender: UIButton) {
        var str = ""
        let eventStore = EKEventStore()
        let calendars = eventStore.calendars(for: .event)
        
        
        
        for calendar in calendars {
            if calendar.title == ChineseCalendar {
                
                let oneMonthAgo = "01-01-2020".toDateTime()
                let oneMonthAfter = "31-01-2020".toDateTime()
                
                let predicate = eventStore.predicateForEvents(withStart: oneMonthAgo as Date, end: oneMonthAfter as Date, calendars: [calendar])
                
                let events = eventStore.events(matching: predicate)
                
                for event in events {
                    str +=  " - \(event.title ?? "none") \n"
                }
            }
        }
//        self.calendarView.addEvent(calendar: ChineseCalendar,"test", date: "02-01-2020".toDateTime() as Date)
        
        let popup = PopupDialog(title: "  Event " , message: str)
        self.present(popup, animated: true, completion: nil)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let today = Date()
                #if KDCALENDAR_EVENT_MANAGER_ENABLED
        self.calendarView.loadEvents(calendar: ChineseCalendar) { error in
                    if error != nil {
                        let message = "The karmadust calender could not load system events. It is possibly a problem with permissions"
                        let alert = UIAlertController(title: "Events Loading Error", message: message, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                #endif
        self.calendarView.setDisplayDate(today, animated: false)
        
    }
    
    func startDate() -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.month = -12
        
        let today = Date()
        
        let threeMonthsAgo = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        
        return threeMonthsAgo
        
    }
    
    func endDate() -> Date {
        
        var dateComponents = DateComponents()
        
        dateComponents.month = 145
        let today = Date()
        
        let twoYearsFromNow = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        
        return twoYearsFromNow
        
    }
    
    
    func headerString(_ date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let myString = formatter.string(from: date as Date)
        return myString
    }
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
        
    }
    
    func calendar(_ calendar: CalendarView, didSelectDate date: Date, withEvents events: [CalendarEvent]) {
        var str = ""
        for event in events {
            str +=  " \(event.title)"
        }
        self.showTitle.text = str
        self.showTitle.lineBreakMode = .byWordWrapping
        self.showTitle.numberOfLines = 3
        //        let popup = PopupDialog(title: "  Event " , message: str)
        //        self.present(popup, animated: true, completion: nil)
        //
        
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
        
    }
    
    func calendar(_ calendar: CalendarView, didLongPressDate date: Date, withEvents events: [CalendarEvent]?) {
        
    }
    
    
    
    
}




