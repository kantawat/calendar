
import UIKit
import Firebase
import EventKit

class DayViewController: UIViewController {

    
    var chineseDay:[String] = []
    var chineseNotlike:[String] = []
    var arrspacialDay = [spacialDayFire]()
    
    var moreDetailView:UIView = UIView()
    var moreDetailConstraint: NSLayoutConstraint?
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chineseDay = self.getChineseDay()
        chineseNotlike = self.getDetailDay()
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(self.setChineseDay())
        
        scrollViewContainer.addArrangedSubview(self.setDetail())
        if(self.checkMoreDetailDay()){
            scrollViewContainer.addArrangedSubview(self.setMoreDetail())
        }


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
    
    
    
    
    
    func setChineseDay() -> UIView{
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant:800).isActive = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        view.insertSubview(backgroundImage, at: 0)
        
        let button = UIButton(frame: CGRect(x: 30, y: 80, width: 100, height: 30))
        button.backgroundColor = .green
        button.setTitle("Calendar", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)

        let Fulllabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        Fulllabel.center = CGPoint(x: 180, y: 370)
        Fulllabel.textAlignment = .center
        Fulllabel.text = initDay.toString(dateFormat: "EEEE, MMM d, yyyy")
        view.addSubview(Fulllabel)

        let chineselabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        chineselabel.center = CGPoint(x: 180, y: 420)
        chineselabel.textAlignment = .center
        chineselabel.text = self.chineseDay[0]
        view.addSubview(chineselabel)

        let eventlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        eventlabel.center = CGPoint(x: 180, y: 500)
        eventlabel.textAlignment = .center
        eventlabel.text = getEventDay(date: initDay)
        eventlabel.numberOfLines = 0
        view.addSubview(eventlabel)
        
        return view
    }
    @objc func buttonAction(sender: UIButton!) {
        performSegue(withIdentifier: "calendarView",sender: self)
    }
    
    
    func setDetail() -> UIView{
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg2")
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        view.insertSubview(backgroundImage, at: 0)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label1.center = CGPoint(x: 100, y: 25)
        label1.textAlignment = .center
        label1.textColor = .white
        label1.text = self.chineseNotlike[0]
        view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label2.center = CGPoint(x: 100, y: 45)
        label2.textAlignment = .center
        label2.textColor = .white
        label2.text = "ไม่ถูกกับ"
        view.addSubview(label2)
        
        let label3 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label3.center = CGPoint(x: 100, y: 65)
        label3.textAlignment = .center
        label3.textColor = .white
        label3.text = self.chineseNotlike[1]
        view.addSubview(label3)
        
        
        let label4 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        label4.center = CGPoint(x: 230, y: 45)
        label4.textAlignment = .center
        label4.textColor = .white
        label4.numberOfLines = 0
        label4.text = self.chineseNotlike[2]
        view.addSubview(label4)
        
        return view
    }
    
    func setMoreDetail() -> UIView{
        moreDetailConstraint = moreDetailView.heightAnchor.constraint(equalToConstant: 100)
        moreDetailConstraint!.isActive = true
        moreDetailView.backgroundColor = .white
        
        var arrbeg = [Int]()
        for x in self.arrspacialDay {
           
            arrbeg += x.detail
        }
        let beg = Array(Set(arrbeg)).sorted()
        
        for (index, element) in beg.enumerated() {
            let beg = begList[element]
            let button = UIButton(frame: CGRect(x: 30 + (110 * index), y: 30, width: 100, height: 30))
            button.backgroundColor = .green
            button.setTitle(beg.name, for: .normal)
            button.addTarget(self, action: #selector(buttonTabAction), for: .touchUpInside)
            moreDetailView.addSubview(button)
        }
        

        return moreDetailView
    }
    
    @objc func buttonTabAction(sender: UIButton!) {
        for x in moreDetailView.subviews{
            if let btn = x as? UIButton {
                btn.backgroundColor = .green
            }else{
                x.removeFromSuperview()
            }
            
        }
        sender.backgroundColor = .blue
        
        let arrBeg = begList.filter {
            (($0 ).name == sender.titleLabel?.text)
        }
        if(!arrBeg.isEmpty){
            let view2 = UIView(frame: CGRect(x: 0, y: 100, width: 400, height: 0))
            view2.backgroundColor = .gray
            view2.isUserInteractionEnabled = true
            moreDetailView.addSubview(view2)
            
            let widthStart = 30
            var hightStart = 20
            
            
            for (_, element) in arrBeg[0].details.enumerated() {
                
                let label = UILabel(frame: CGRect(x: widthStart, y: hightStart, width: 300, height: 100))
                label.textAlignment = .center
                label.numberOfLines = 0
                label.text = element.name
                moreDetailView.addSubview(label)

                hightStart += 100
                var hightBox = 0
                for (index, elementlist) in element.list.enumerated() {
                    let row = (index > 2 ? (hightStart + (150 * (index/3))) : hightStart )
                    let col = (widthStart + (110 * (index % 3)))

                    let image = UIImage(named: "Image")
                    let btn = UIButton(frame: CGRect(x: col, y: row, width: 100, height: 70))
                    btn.setTitle(elementlist.name, for: .normal)
                    btn.setImage(image, for: .normal)
                    btn.addTarget(self, action: #selector(buttonImgAction), for: .touchUpInside)
                    moreDetailView.addSubview(btn)

                    let label = UILabel(frame: CGRect(x: col, y: row + 70, width: 100, height: 100))
                    label.textAlignment = .center
                    label.numberOfLines = 0
                    label.text = elementlist.name
                    moreDetailView.addSubview(label)

                    hightBox = row + 140
                }
                hightStart = hightBox
            
            }
            
            view2.heightAnchor.constraint(equalToConstant: CGFloat(hightStart)).isActive = true
            
            moreDetailConstraint!.isActive = false
            moreDetailConstraint = moreDetailView.heightAnchor.constraint(equalToConstant: 2300)
            moreDetailConstraint!.isActive = true
        }
        
    }
    @objc func buttonImgAction(sender: UIButton!) {
        sender.backgroundColor = .blue
        searchMap = sender.titleLabel!.text!
        performSegue(withIdentifier: "tomap",sender: self)
    }
    func MoreDetail() -> UIView{
        //        let view = UIView()
        moreDetailConstraint = moreDetailView.heightAnchor.constraint(equalToConstant: 2300)
        moreDetailConstraint!.isActive = true
        moreDetailView.backgroundColor = .white
        
        let arrspacialDay = spacialDayList.filter {
            (($0 ).monthChinese == Int(self.chineseDay[2])) && (($0 ).dayChinese == Int(self.chineseDay[1]))
        }
        var arrbeg = [Int]()
        for x in arrspacialDay {
            
            arrbeg += x.detail
        }
        let beg = Array(Set(arrbeg)).sorted()
        
        for (index, element) in beg.enumerated() {
            let beg = begList[element]
            let button = UIButton(frame: CGRect(x: 30 + (110 * index), y: 30, width: 100, height: 30))
            button.backgroundColor = .green
            button.setTitle(beg.name, for: .normal)
            button.addTarget(self, action: #selector(buttonTabAction), for: .touchUpInside)
            moreDetailView.addSubview(button)
        }
        
        
        return moreDetailView
    }

    func getChineseDay() -> [String]{
        var strlist = [String]()
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: initDate.toDateTime() as Date)
        let date2 = calendar.startOfDay(for: initDay as Date)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        var diffDay = components.day! + 1
        for year in chineseCalendarList{
            for i  in year.detailMonths{
                if(diffDay - i.amountDay <= 0 ){
                    strlist.append("วันที่ \(diffDay) เดือน \(i.nameMonth) ปี \(year.nameThaiYear)")
                    strlist.append("\(diffDay)")
                    strlist.append(i.nameMonth)
                    return strlist;
                }else{
                    diffDay = (diffDay - i.amountDay)
                }
            }
        }
        return []
    }
    func getDetailDay() -> [String]{
        var strlist = [String]()
        let calendar = Calendar.current

        let date1 = calendar.startOfDay(for: "01-01-2020".toDateTime() as Date)
        let date2 = calendar.startOfDay(for: initDay as Date)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        let diffDay = components.day
        print(components)

        let posnotlike = abs( diffDay! % notLikeList.count)
        let notLike1 = notLikeList[posnotlike].year1
        let notLike2 = notLikeList[posnotlike].year2

        let posgoodbad = abs( diffDay! % goodOrBadList.count)

        strlist.append(notLike1.nameThai)
        strlist.append(notLike2.nameThai)
        strlist.append(goodOrBadList[posgoodbad].name)
        return strlist
    }
    func checkMoreDetailDay() -> Bool{
        self.arrspacialDay = spacialDayList.filter {
            (($0 ).monthChinese == Int(self.chineseDay[2])) && (($0 ).dayChinese == Int(self.chineseDay[1]))
        }
        if(!self.arrspacialDay.isEmpty){
            return true
        }else{
            return false
        }
    }

}
