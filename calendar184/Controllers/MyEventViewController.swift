
import UIKit
import EventKit

class MyEventViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var listEventtitle:[String] = []
    var listEventcontent:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.dataSource = self
        tableView.delegate = self
        
        let eventStore = EKEventStore()
           let calendars = eventStore.calendars(for: .event)
           
           for calendar in calendars {
               if calendar.title == ChineseCalendar {
                   let date1 = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: initDay as Date)!
                   let date2 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: initDay as Date)!
                   
                   let predicate = eventStore.predicateForEvents(withStart: date1 , end: date2, calendars: [calendar])
                   
                   let events = eventStore.events(matching: predicate)
                   
                   for event in events {
                    
                    listEventtitle.append(event.title)
                
                        listEventcontent.append(event.notes!)
                     
                   }
               }
           }
    }
    
    @IBAction func onBack(_ sender: Any) {
        performSegue(withIdentifier: "myeventtocal",sender: self)
    }
    

}
extension MyEventViewController: UITableViewDelegate, UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listEventtitle.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.00;//Choose your custom row height
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! myEventTableViewCell
        if(self.listEventtitle.count > 0){
            
            tableView.backgroundColor = UIColor.clear
            cell.backgroundColor = UIColor.clear
            cell.titleEvent.text = self.listEventtitle[indexPath.row]
            cell.contentEvent.text = self.listEventcontent[indexPath.row]
        }
                   
       return cell
    }
               
       
}
