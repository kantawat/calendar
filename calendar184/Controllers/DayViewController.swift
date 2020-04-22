
import UIKit
import Firebase
import EventKit
import SCLAlertView

class DayViewController: UIViewController {

//    var arrspacialDay = [spacialDayFire]()
    
//    @IBOutlet weak var tableView: UITableView!
    
    var dayChiese = dayChinsesShow(date: NSDate(), day:"",month:"",year:"",thaiyear:"")
    
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
        
        dayChiese = getChineseDay()
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(self.setChineseDay())
        
        scrollViewContainer.addArrangedSubview(self.setDetail())
        if(dayChiese.spacials.count > 0){
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
        
//        tableView.delegate = self as! UITableViewDelegate
//        tableView.dataSource = self as! UITableViewDataSource
        }

    func setChineseDay() -> UIView{
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant:812).isActive = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        var imagepath = ""
        if(dayChiese.spacials.count > 0){
            imagepath = dayChiese.spacials[0].image
        }else if(dayChiese.goodbadtype == "good"){
            imagepath = "gooddaybg"
        }else{
            imagepath = "baddaybg"
        }
        backgroundImage.image = UIImage(named: imagepath)
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        view.insertSubview(backgroundImage, at: 0)
        
        let button = UIButton(frame: CGRect(x: 10, y: 30, width: 40, height: 40))
        let image = UIImage(named: "backbg") as UIImage?
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
        
        let button2 = UIButton(frame: CGRect(x: 320, y: 30, width: 40, height: 40))
        let image2 = UIImage(named: "seenote") as UIImage?
        button2.setImage(image2, for: .normal)
        button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)
        view.addSubview(button2)
    
        let Full1label = UILabel(frame: CGRect(x: 112, y: 94, width: 143, height: 21))
        Full1label.textAlignment = .center
        Full1label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full1label.text = dayChiese.sub1dayStr
        view.addSubview(Full1label)
        
        let Full2label = UILabel(frame: CGRect(x: 112, y: 123, width: 143, height: 21))
        Full2label.textAlignment = .center
        Full2label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full2label.text = dayChiese.sub2dayStr
        view.addSubview(Full2label)
        
        let Full3label = UILabel(frame: CGRect(x: 42, y: 450, width: 38, height: 21))
        Full3label.textAlignment = .center
        Full3label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full3label.text = "วัน"
        view.addSubview(Full3label)
        
        let Full4label = UILabel(frame: CGRect(x: 42, y: 521, width: 38, height: 21))
        Full4label.textAlignment = .center
        Full4label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full4label.text = dayChiese.day
        view.addSubview(Full4label)
        
        let Full5label = UILabel(frame: CGRect(x: 42, y: 589, width: 38, height: 21))
        Full5label.textAlignment = .center
        Full5label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full5label.text = "เดือน"
        view.addSubview(Full5label)
        
        let Full6label = UILabel(frame: CGRect(x: 42, y: 657, width: 38, height: 21))
        Full6label.textAlignment = .center
        Full6label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full6label.text = dayChiese.month
        view.addSubview(Full6label)
        
        let Full7label = UILabel(frame: CGRect(x: 295, y: 450, width: 38, height: 21))
        Full7label.textAlignment = .center
        Full7label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full7label.text = "ปี"
        view.addSubview(Full7label)
        
        let Full8label = UILabel(frame: CGRect(x: 295, y: 521, width: 38, height: 21))
        Full8label.textAlignment = .center
        Full8label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full8label.text = dayChiese.thaiyear
        view.addSubview(Full8label)
        
        let Full9label = UILabel(frame: CGRect(x: 295, y: 589, width: 38, height: 21))
        Full9label.textAlignment = .center
        Full9label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full9label.text = String(dayChiese.year.prefix(1))
        view.addSubview(Full9label)
        
        let Full10label = UILabel(frame: CGRect(x: 295, y: 657, width: 38, height: 21))
        Full10label.textAlignment = .center
        Full10label.font = UIFont(name: "JSChawlewhieng", size: 26.00)
        Full10label.text = "年"
        view.addSubview(Full10label)
    
        
        return view
    }
    @objc func buttonAction(sender: UIButton!) {
        performSegue(withIdentifier: "calendarView",sender: self)
    }
    @objc func button2Action(sender: UIButton!) {
        performSegue(withIdentifier: "caltomyevent",sender: self)
    }
    
    
    func setDetail() -> UIView{
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "topbg")
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        view.insertSubview(backgroundImage, at: 0)
        
        let backgroundImage1 = UIImageView(frame: CGRect(x: 40, y: 100, width: 290, height: 130))
        backgroundImage1.image = UIImage(named: "startbg")
        backgroundImage1.contentMode = UIViewContentMode.scaleToFill
        view.addSubview(backgroundImage1)
        
        let Image1 = UIImageView(frame: CGRect(x: 100, y: 125, width: 40, height: 40))
        Image1.image = UIImage(named: dayChiese.notlike1eng)
         Image1.contentMode = UIViewContentMode.scaleToFill
        view.addSubview(Image1)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label1.center = CGPoint(x: 70, y: 125)
        label1.textAlignment = .center
        label1.textColor = .white
        label1.text = dayChiese.notlike1
        view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label2.center = CGPoint(x: 85, y: 150)
        label2.textAlignment = .center
        label2.textColor = .white
        label2.text = "ไม่ถูกกับ"
        view.addSubview(label2)
        
        let Image2 = UIImageView(frame: CGRect(x: 100, y: 175, width: 40, height: 40))
         Image2.image = UIImage(named: dayChiese.notlike2eng)
         Image2.contentMode = UIViewContentMode.scaleToFill
        view.addSubview(Image2)
        
        let label3 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label3.center = CGPoint(x: 70, y: 175)
        label3.textAlignment = .center
        label3.textColor = .white
        label3.text = dayChiese.notlike2
        view.addSubview(label3)
        
        
        let label4 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        label4.center = CGPoint(x: 250, y: 170)
        label4.textAlignment = .center
        label4.textColor = .white
        label4.numberOfLines = 0
        label4.text = dayChiese.goodbad
        view.addSubview(label4)
        
        return view
    }
    
    func setMoreDetail() -> UIView{
        moreDetailConstraint = moreDetailView.heightAnchor.constraint(equalToConstant: 100)
        moreDetailConstraint!.isActive = true
        moreDetailView.backgroundColor = .clear
        
        
        var arrbeg = [Int]()
        for x in dayChiese.spacials {

            arrbeg += x.detail
        }
        let beg = Array(Set(arrbeg)).sorted()

        for (index, element) in beg.enumerated() {
            let beg = begList[element]
            let image = UIImage(named: "unactivebt")
            
            let button = UIButton(frame: CGRect(x: 30 + (110 * index), y: 50, width: 100, height: 30))
            button.setTitle(beg.name, for: .normal)
            button.setImage(image, for: .normal)
            button.addTarget(self, action: #selector(buttonTabAction), for: .touchUpInside)
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
            label.textAlignment = .center
            label.textColor = .white
            label.text = beg.name
           
             button.addSubview(label)
            moreDetailView.addSubview(button)
            
        }
        

        return moreDetailView
    }
    
    @objc func buttonTabAction(sender: UIButton!) {
        for x in moreDetailView.subviews{
            if let btn = x as? UIButton {
                let images = UIImage(named: "unactivebt")
                btn.setImage(images, for: .normal)
            }else{
                x.removeFromSuperview()
            }
            
        }
        let imagee = UIImage(named: "activebt")
        sender.setImage(imagee, for: .normal)
//        sender.backgroundColor = .blue
        
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

                    let image = UIImage(named: elementlist.img)
                    let btn = UIButton(frame: CGRect(x: col, y: row, width: 100, height: 70))
                    btn.setTitle(elementlist.name, for: .normal)
                    btn.setImage(image, for: .normal)
                    btn.tag = index
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
        let img = UIImage(named: sender.titleLabel!.text!)!
        itemDialog(img: img,name: sender.titleLabel!.text!)
    }
    func itemDialog(img:UIImage,name:String) {
        
        let appearance = SCLAlertView.SCLAppearance(
            kCircleIconHeight: 50, kWindowWidth: screenWidth - 50,
            kTitleFont: UIFont(name: "JSChawlewhieng", size: 28)!,
            kTextFont: UIFont(name: "JSChawlewhieng", size: 20)!,
            kButtonFont: UIFont(name: "JSChawlewhieng", size: 20)!,
            showCloseButton: false
        )
        
        let alert = SCLAlertView(appearance: appearance)
        let reactsize = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: screenWidth - 50, height: 250))
        let subview = UIView(frame: reactsize)
        
        
        let reactsize4 = CGRect(origin: CGPoint(x: 20 ,y : 20 ), size: CGSize(width: 200, height: 100))
        let label = UILabel(frame: reactsize4)
        label.font = UIFont(name: "JSChawlewhieng", size: 20)!
        label.text = "เหตุที่ต้องเป็นส้มสีทองก็เพราะ สีทอง เป็นสีแห่งความเป็นสิริมงคล" + "ไม่จำเป็นว่าต้องเป็นส้มสายพันธุ์พิเศษอะไร ขอให้มีเปลือกสีส้มหรือสีเหลืองทองก็เป็นอันใช้ได้"
        label.numberOfLines = 0
        subview.addSubview(label)
        
        
        
        
        alert.customSubview = subview
        alert.addButton("see map") {
            searchMap = name
            self.performSegue(withIdentifier: "tomap",sender: self)
        }
        alert.addButton("done") {}
        
        //        alert.addButton("Duration Button", backgroundColor: UIColor.brown, textColor: UIColor.yellow) {}
        
    //    var image: UIImage?
    //    let url = NSURL(string: userPic)! as URL
    //    if let imageData: NSData = NSData(contentsOf: url) {
    //        image = UIImage(data: imageData as Data)
    //    }
        
        alert.showInfo(name, subTitle: "", circleIconImage: makeRoundImg(image: img))
    }
    func MoreDetail() -> UIView{
        //        let view = UIView()
        moreDetailConstraint = moreDetailView.heightAnchor.constraint(equalToConstant: 2300)
        moreDetailConstraint!.isActive = true
        moreDetailView.backgroundColor = .white
        
        var arrbeg = [Int]()
        for x in dayChiese.spacials {
            
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

    func getChineseDay() -> dayChinsesShow {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: initDate.toDateTime() as Date)
        let date2 = calendar.startOfDay(for: initDay as Date)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        var diffDay = components.day! + 1
        for year in chineseCalendarList{
            for i  in year.detailMonths{
                if(diffDay - i.amountDay <= 0 ){
                    return dayChinsesShow(date: initDay,
                                               day: String(diffDay),
                                               month: String(i.nameMonth),
                                               year: String(year.nameChineseYear),
                                               thaiyear:String(year.nameThaiYear))
                }else{
                    diffDay = (diffDay - i.amountDay)
                }
            }
        }
        return dayChinsesShow(date: NSDate(), day:"",month:"",year:"",thaiyear:"")
    }
    
//    func checkMoreDetailDay() -> Bool{
//        self.arrspacialDay = spacialDayList.filter {
//            (($0 ).monthChinese == Int(dayChiese.month)) && (($0 ).dayChinese == Int(dayChiese.day))
//        }
//        if(!self.arrspacialDay.isEmpty){
//            return true
//        }else{
//            return false
//        }
//    }

}
