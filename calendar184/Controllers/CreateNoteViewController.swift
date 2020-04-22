
import UIKit
import Firebase
import KDCalendar
import EventKit

class CreateNoteViewController: UIViewController{
    @IBOutlet weak var titleNote: UITextField!
    @IBOutlet weak var atricleNote: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    override func viewDidAppear(_ animated: Bool) {
        atricleNote.borderStyle = UITextBorderStyle.roundedRect;
    }
    
    @IBAction func onBackBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "createnotetocalendar",sender: self)
    }
    
    @IBAction func onCreateBtn(_ sender: UIButton) {
        
        let mili = getCurrentMillis(date: datepicker.date)
        let title = titleNote.text ??  ""
        let subtile = atricleNote.text ??  ""
        
        let eventCus = eventCustom(date: datepicker.date as NSDate, title:title ,subtile:subtile)
        
        let obj = ["date": eventCus.date,
                   "title": eventCus.title,
                   "subtile": eventCus.subtile]
   
   
        
        ref.child("users").child("\(userUid)/notes/\(mili)").setValue(obj)
        
        let eventStore : EKEventStore = EKEventStore()

        let calendars = eventStore.calendars(for: .event)
        
        for calendar in calendars {
            if calendar.title == ChineseCalendar {
               eventStore.requestAccess(to: .event) { (granted, error) in

               if (granted) && (error == nil) {
                   let event:EKEvent = EKEvent(eventStore: eventStore)

                   event.title = title
                event.startDate = self.datepicker.date
                event.endDate = self.datepicker.date
                   event.notes = subtile
                   event.calendar = calendar
                   do {
                       try eventStore.save(event, span: .thisEvent)
                   } catch let error as NSError {
                       print("failed to save event with error : \(error)")
                   }
                   print("Saved Event")
               }
               else{

                   print("failed to save event with error : \(error) or access not granted")
               }
            }
        }
    }

        
        
       performSegue(withIdentifier: "createnotetocalendar",sender: self)
    }
    
}
