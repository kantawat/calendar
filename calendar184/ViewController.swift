//
//  ViewController.swift
//  calendar184
//
//  Created by Lin Por on 10/12/19.
//  Copyright © 2019 kantawat. All rights reserved.
//

import UIKit
import KDCalendar

class ViewController: UIViewController , CalendarViewDataSource{
    
    @IBOutlet weak var calendarView: CalendarView!
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
        
        calendarView.direction = .horizontal
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
        
        
        calendarView.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1.0)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let today = Date()
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
        
        dateComponents.month = 12
        let today = Date()
        
        let twoYearsFromNow = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        
        return twoYearsFromNow
        
    }
    
    
    func headerString(_ date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: date as Date)
        return myString
    }
    
    
}
