

import UIKit
import PopupDialog

class DaliyViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    var list = ["part1","part2","part3"]
    var btnSelect = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCellReusedIdentifier()
        
        
        
        dayChiese = getChineseDay()
        
        print("2part : \(dayChiese.arrbeg.count)")
       if(dayChiese.arrbeg.count == 0){
            list.remove(at: 2)
        }
        
        var isFirst = true
        for x in dayChiese.arrbeg{
            if(isFirst){
                isFirst=false
                btnSelect = x+1
            }
        }
        
        setupTableView()

    }
    
    private func registerTableViewCellReusedIdentifier() {
        
        let nibCustomCell1 = UINib(nibName: "Part1Cell", bundle: Bundle.main)
        tableView.register(nibCustomCell1, forCellReuseIdentifier: "Part1Cell")
        
        let nibCustomCell2 = UINib(nibName: "Part2Cell", bundle: Bundle.main)
        tableView.register(nibCustomCell2, forCellReuseIdentifier: "Part2Cell")
        
        let nibCustomCell3 = UINib(nibName: "Part2twoCell", bundle: Bundle.main)
        tableView.register(nibCustomCell3, forCellReuseIdentifier: "Part2twoCell")
        
        let nibCustomCell4 = UINib(nibName: "Part3Cell", bundle: Bundle.main)
        tableView.register(nibCustomCell4, forCellReuseIdentifier: "Part3Cell")
        
        let nibCustomCell5 = UINib(nibName: "Part3twoCell", bundle: Bundle.main)
        tableView.register(nibCustomCell5, forCellReuseIdentifier: "Part3twoCell")
        
        let nibCustomCell6 = UINib(nibName: "Part3threeCell", bundle: Bundle.main)
        tableView.register(nibCustomCell6, forCellReuseIdentifier: "Part3threeCell")
        
        let nibCustomCell7 = UINib(nibName: "Part3fourCell", bundle: Bundle.main)
        tableView.register(nibCustomCell7, forCellReuseIdentifier: "Part3fourCell")
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = true
        tableView.isScrollEnabled = true
        
        // Remove space between sections.
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        
        // Remove space at top and bottom of tableView.
        tableView.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        tableView.tableFooterView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        
    
    }
    
    

    

}
extension DaliyViewController: UITableViewDelegate, UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 812;
        }else if(indexPath.row == 1){
            if(list.count == 2){
                return 300;
            }else{
                return 400;
            }
        }else{
            switch btnSelect {
            case 1:
                return 1800;
            case 2:
                return 1500;
            case 3:
                return 1400;
            default:
                return 630;
            }
            
        }
        
            
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell:Part1Cell = tableView.dequeueReusableCell(withIdentifier: "Part1Cell") as! Part1Cell
             cell.delegate = self
            return cell
        }else if(indexPath.row == 1){
            if(list.count == 2){
                let cell = tableView.dequeueReusableCell(withIdentifier: "Part2Cell") as! Part2Cell
                return cell
            }else{
                let cell:Part2twoCell = tableView.dequeueReusableCell(withIdentifier: "Part2twoCell") as! Part2twoCell
                cell.delegate = self
                return cell
            }
            
        }else{
            switch btnSelect {
            case 1:
                let cell:Part3Cell = tableView.dequeueReusableCell(withIdentifier: "Part3Cell") as! Part3Cell
                cell.delegate = self
                return cell;
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Part3twoCell") as! Part3twoCell
                cell.delegate = self
                return cell;
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Part3threeCell") as! Part3threeCell
                cell.delegate = self
                return cell;
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Part3fourCell") as! Part3fourCell
                cell.delegate = self
                return cell;
            }
            
        }
        
        
                   
       
    }
               
       
}
extension DaliyViewController : Part1CellDelegate {
    func clickCalendar() {
        print("haveclick")
        self.performSegue(withIdentifier: "calendarView",sender: self)
    }
    
    func clickMyNote() {
        self.performSegue(withIdentifier: "caltomyevent",sender: self)
    }
    

}
extension DaliyViewController : Part2twoCellDelegate {
    func btnBeg(select: Int) {
        self.btnSelect = select
        tableView.reloadData()
    }
}
extension DaliyViewController : Part3CellDelegate {
    func btnBegItem() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "alert")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
}

//extension DaliyViewController : Part3twoCellDelegate {
//    func btnBegItem(select: String) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let myAlert = storyboard.instantiateViewController(withIdentifier: "alert")
//        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        self.present(myAlert, animated: true, completion: nil)
//    }
//    
//}
//
//extension DaliyViewController : Part3threeCellDelegate {
//    func btnBegItem(select: String) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let myAlert = storyboard.instantiateViewController(withIdentifier: "alert")
//        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        self.present(myAlert, animated: true, completion: nil)
//    }
//    
//}
//extension DaliyViewController : Part3fourCellDelegate {
//    func btnBegItem(select: String) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let myAlert = storyboard.instantiateViewController(withIdentifier: "alert")
//        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        self.present(myAlert, animated: true, completion: nil)
//    }
//    
//}
