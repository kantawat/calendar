
import UIKit
import Firebase
import EventKit

class DayViewController: UIViewController {
//
//    @IBOutlet weak var normalDay: UILabel!
//    @IBOutlet weak var typeDay: UILabel!
//    @IBOutlet weak var chineseDay: UILabel!
//
//    @IBOutlet weak var yearNotLike1: UILabel!
//    @IBOutlet weak var yearNotLike2: UILabel!
//    @IBOutlet weak var goodOrbad: UILabel!
    
    var isspacialDay = ""
    var dayChinese = 0
    var monthChinese = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(redView)
        scrollViewContainer.addArrangedSubview(blueView)
        scrollViewContainer.addArrangedSubview(greenView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let redView: UIView = {
        let vieww = UIView()
        vieww.heightAnchor.constraint(equalToConstant:800).isActive = true
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        vieww.insertSubview(backgroundImage, at: 0)
        
        
        
//        vieww.backgroundColor = UIColor(patternImage: UIImage(named:"Image-1")!)
        return vieww
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg2")
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        view.insertSubview(backgroundImage, at: 0)
        
        return view
    }()
    
    let greenView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 800).isActive = true
        view.backgroundColor = .white
        return view
    }()


//        normalDay.text = initDay.toString(dateFormat: "EEEE, MMM d, yyyy")
        
//        self.setChineseDay()
//        self.setEventDay()
//        self.setDetailDay()
//        self.setMoreDetailDay()
    
    }
//    func setChineseDay(){
//        let calendar = Calendar.current
//
//        // Replace the hour (time) of both dates with 00:00
//        let date1 = calendar.startOfDay(for: initDate.toDateTime() as Date)
//        let date2 = calendar.startOfDay(for: initDay as Date)
//
//        let components = calendar.dateComponents([.day], from: date1, to: date2)
//        var diffDay = components.day
//        print(components)
//        for year in chineseCalendarList{
//            for i  in year.detailMonths{
//                if(diffDay! - i.amountDay <= 0 ){
////                    print(diffDay
//                    self.chineseDay.text = "วันที่ \(diffDay!) เดือน \(i.nameMonth) ปี \(year.nameThaiYear)"
//                    self.dayChinese = diffDay!
//                    self.monthChinese = i.nameMonth
//                    return;
//                }else{
//                    diffDay = (diffDay! - i.amountDay)
//                }
//            }
//        }
//    }
//    func setEventDay(){
//        var str = ""
//        let eventStore = EKEventStore()
//        let calendars = eventStore.calendars(for: .event)
//
//        for calendar in calendars {
//            print(calendar.title )
//            if calendar.title == ChineseCalendar {
//                let date1 = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: initDay as Date)!
//                let date2 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: initDay as Date)!
//
//                let predicate = eventStore.predicateForEvents(withStart: date1 , end: date2, calendars: [calendar])
//
//                let events = eventStore.events(matching: predicate)
//
//                for event in events {
//                    self.isspacialDay = event.title
//                    print(event.title)
//                    str +=  " - \(event.title ?? "none") \n"
//                }
//            }
//        }
//        self.typeDay.text = "วันพิเศษ  : \(str)"
//        self.typeDay.sizeToFit()
//    }
//    func setDetailDay(){
//        let calendar = Calendar.current
//
//        let date1 = calendar.startOfDay(for: "01-01-2020".toDateTime() as Date)
//        let date2 = calendar.startOfDay(for: initDay as Date)
//
//        let components = calendar.dateComponents([.day], from: date1, to: date2)
//        let diffDay = components.day
//        print(components)
//
//        let posnotlike = ( diffDay! % notLikeList.count)
//        let notLike1 = notLikeList[posnotlike].year1
//        let notLike2 = notLikeList[posnotlike].year2
//
//        let posgoodbad = ( diffDay! % goodOrBadList.count)
//
//        self.yearNotLike1.text = notLike1.nameThai
//        self.yearNotLike2.text = notLike2.nameThai
//        self.goodOrbad.text = goodOrBadList[posgoodbad].name
//    }
//    func setMoreDetailDay(){
//        let arrspacialDay = spacialDayList.filter {
//            (($0 ).monthChinese == Int(self.monthChinese) as! Int) && (($0 ).dayChinese == self.dayChinese)
//        }
//        for x in arrspacialDay {
//             print("self.isspacialDay \(x.detail)")
//        }
//        let arr = begList[0]
//        for x in arr.details {
//            print("beg  \(x.name)")
////            print("self.isspacialDay \(x.list)")
//        }
//
//    }
    
//    @IBAction func goCalendar(_ sender: UIButton) {
//        performSegue(withIdentifier: "calendarView",sender: self)
//    }
//
//    @IBAction func goDetail(_ sender: UIButton) {
//        performSegue(withIdentifier: "moreDetaillView",sender: self)
//    }
//
//}
