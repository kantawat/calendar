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

class ViewController: UIViewController , CalendarViewDataSource , CalendarViewDelegate{
    

    
    @IBOutlet weak var labelHeader: UILabel!
    
    @IBOutlet weak var calendarView: CalendarView!
    var refDatabase: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let dataYears = chineseCalendar.detailYears()
        var dateYear = chineseCalendar.startDate.toDateTime()
        for dataYear in dataYears {
            for (indexMouth, valueMonth) in dataYear.arrDetailMonth.enumerated() {
                    print("start day : \(dateYear)  ")
                if dataYear.nameYear == "2"{
                    var arr = spacialDays.arrDetailMonths().filter {
                        $0.nameMonth == Int(valueMonth.nameMonth)
                    }
                    if !arr.isEmpty{
                        for v in arr[0].arrSpacialDay{
                            let date = dateYear.addDays(v.day) as NSDate
                            print("day : \(v.day) day : \(date)")
                            self.calendarView.addEvent(v.name, date: date as Date)
                            print("name : \(v.name) day : \(date)")
                        }
                        print("arr month : \(arr[0].nameMonth) amount : \(valueMonth.amountDay) ")
                        
                    }
                }
                
                
                dateYear = dateYear.addDays(valueMonth.amountDay) as NSDate
                }
        }
        
        
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
        
        
        
    }
    
    
    
    @IBAction func setListDay(_ sender: UIButton) {


        let today = NSDate()

        var arr = spacialDays.arrDetailMonths().filter {
            $0.nameMonth == today.getMonth()
        }
        var str = ""
        for v in arr[0].arrSpacialDay{
            str +=  " - Day : \(v.day)  Event : \(v.name) \n"
        }


        let popup = PopupDialog(title: "month \(today.getMonth())", message: str)
        self.present(popup, animated: true, completion: nil)



    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let today = Date()
//        #if KDCALENDAR_EVENT_MANAGER_ENABLED
//        self.calendarView.loadEvents() { error in
//            if error != nil {
//                let message = "The karmadust calender could not load system events. It is possibly a problem with permissions"
//                let alert = UIAlertController(title: "Events Loading Error", message: message, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
//        #endif
        self.calendarView.setDisplayDate(today, animated: false)
        
    }
    
    func startDate() -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.month = -10
        
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
        self.labelHeader.text = str
        
//        let popup = PopupDialog(title: "  Event " , message: str)
//        self.present(popup, animated: true, completion: nil)
        
        
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
        
    }
    
    func calendar(_ calendar: CalendarView, didLongPressDate date: Date, withEvents events: [CalendarEvent]?) {
        
    }
    
    
    
    
}




