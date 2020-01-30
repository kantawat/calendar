

import UIKit
import Firebase

class CalendarViewController: UIViewController, UIScrollViewDelegate {
//    @IBOutlet weak var yearScroll: UIScrollView!
//    @IBOutlet weak var yearContainer: UIStackView!
//    var ref: DatabaseReference!
//    var chineseCalendarList = [chineseYearCalendarFire]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.ref = Database.database().reference()
//
//
//        awaitFuncChineseCalendar { (Bool) in
//            if(Bool){
//                print("list : " , self.chineseCalendarList )
//                for (index, year) in self.chineseCalendarList.enumerated() {
//                    let button = UIButton(frame: CGRect(x: 0, y: 0 + (index * 50), width: 200, height: 50))
//                    button.setTitle("start : \(year.startDate)", for: .normal)
//                    button.setTitleColor(
//                        UIColor(red: 171/255.0, green: 178/255.0, blue: 185/255.0, alpha: 1.0), for: .normal)
//                    button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
//
//                    if([0,1,2].contains(index)){
//                        self.view.addSubview(button)
//                    }else{
//                         self.yearContainer.addArrangedSubview(button)
//                    }
//
//
//                }
//            }
//        }
//
//
//        yearContainer.spacing = 10
//        yearContainer.translatesAutoresizingMaskIntoConstraints = false
//        yearContainer.leadingAnchor.constraint(equalTo: yearScroll.leadingAnchor).isActive = true
//        yearContainer.trailingAnchor.constraint(equalTo: yearScroll.trailingAnchor).isActive = true
//        yearContainer.topAnchor.constraint(equalTo: yearScroll.topAnchor).isActive = true
//        yearContainer.bottomAnchor.constraint(equalTo: yearScroll.bottomAnchor).isActive = true
//        // this is important for scrolling
//        yearContainer.widthAnchor.constraint(equalTo: yearScroll.widthAnchor).isActive = true
    }
    

    
    

//
//
//    @IBAction func back(_ sender: UIButton) {
//        performSegue(withIdentifier: "BruceTheHoon",sender: self)
//    }
//
//    @objc func buttonAction(sender: UIButton!) {
//        sender.isSelected = !sender.isSelected
//        if sender.isSelected {
//            sender.backgroundColor = UIColor(red: 93/255.0, green: 173/255.0, blue: 226/255.0, alpha: 0.7)
//        } else {
//            sender.backgroundColor = .white
//        }
//
//    }
//    func awaitFuncChineseCalendar(completion: @escaping (_ success: Bool) -> Void) {
//
//        var itemlist = [chineseYearCalendarFire]()
//        self.ref.child("chineseCalendar").child(initDate).observeSingleEvent(of: .value, with: { (snapshot) in
//
//            let enumerator = snapshot.children
//            while let rest = enumerator.nextObject() as? DataSnapshot {
//                let newModel = chineseYearCalendarFire(dict: rest.value as! [String : AnyObject])
//                itemlist.append(newModel)
//            }
//            self.chineseCalendarList = itemlist
//
//            completion(true)
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//
//    }
//
}
