

import UIKit

class DaliyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var list = [1,2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCellReusedIdentifier()
        
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
            return 400;
//            return 300;
        }else{
            return 600;
        }
        
            
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "Part1Cell") as! Part1Cell
            return cell
        }else if(indexPath.row == 1){
            let cell:Part2twoCell = tableView.dequeueReusableCell(withIdentifier: "Part2twoCell") as! Part2twoCell
//            cell = tableView.dequeueReusableCell(withIdentifier: "Part2Cell") as! Part2Cell
            cell.delegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Part3Cell") as! Part3Cell
            return cell
        }
        
        
                   
       
    }
               
       
}
extension DaliyViewController : Part2twoCellDelegate {
    func MyCell(select: String) {
        self.list.append(3)
        tableView.reloadData()
    }
    

    
}
