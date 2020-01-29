//
//  DayViewController.swift
//  calendar184
//
//  Created by Yuan Kan on 29/1/20.
//  Copyright © 2020 kantawat. All rights reserved.
//

import UIKit
import Firebase
import EventKit

class DayViewController: UIViewController {

    @IBOutlet weak var normalDay: UILabel!
    @IBOutlet weak var typeDay: UILabel!
    @IBOutlet weak var chineseDay: UILabel!
    
    var ref: DatabaseReference!
    var chineseCalendarList = [chineseCalendarFire]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()

        normalDay.text = initDay.toString(dateFormat: "EEEE, MMM d, yyyy")
        
        awaitFuncChineseCalendar { (Bool) in
            if(Bool){
                let calendar = Calendar.current
                
                // Replace the hour (time) of both dates with 00:00
                let date1 = calendar.startOfDay(for: initDate.toDateTime() as Date)
                let date2 = calendar.startOfDay(for: initDay as Date)
                
                let components = calendar.dateComponents([.day], from: date1, to: date2)
                var diffDay = components.day
                print(components)
                for year in self.chineseCalendarList{
                    for i  in year.detailMonths{
                        if(diffDay! - i.amountDay <= 0 ){
                            print(diffDay)
                            self.chineseDay.text = "วันที่ \(diffDay!) เดือน \(i.nameMonth) ปี \(year.nameThaiYear)"
                            return;
                        }else{
                            diffDay = (diffDay! - i.amountDay)
                        }
                    }
                }
                
            }
        }
        
        var str = ""
        let eventStore = EKEventStore()
        let calendars = eventStore.calendars(for: .event)
        
        for calendar in calendars {
            print(calendar.title )
            if calendar.title == ChineseCalendar {
                let date1 = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: initDay as Date)!
                let date2 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: initDay as Date)!
                
               let predicate = eventStore.predicateForEvents(withStart: date1 , end: date2, calendars: [calendar])
                
                let events = eventStore.events(matching: predicate)
                
                for event in events {
                    print(event.title)
                    str +=  " - \(event.title ?? "none") \n"
                }
            }
        }
        self.typeDay.text = "วันพิเศษ  : \(str)"
        self.typeDay.sizeToFit()
    }
    
    func awaitFuncChineseCalendar(completion: @escaping (_ success: Bool) -> Void) {
    
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
    @IBAction func goCalendar(_ sender: UIButton) {
        performSegue(withIdentifier: "calendarView",sender: self)
    }
    
    @IBAction func goDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "moreDetaillView",sender: self)
    }

}
