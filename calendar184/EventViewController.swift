
import UIKit

class EventViewController: UIViewController {

   
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
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(self.setChineseDay())
        
        
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
//        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        view.insertSubview(backgroundImage, at: 0)
        
//        let button = UIButton(frame: CGRect(x: 30, y: 80, width: 100, height: 30))
//        button.backgroundColor = .green
//        button.setTitle("Calendar", for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        view.addSubview(button)
        
        let Fulllabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        Fulllabel.center = CGPoint(x: 180, y: 370)
        Fulllabel.textAlignment = .center
        Fulllabel.text = initDay.toString(dateFormat: "EEEE, MMM d, yyyy")
        view.addSubview(Fulllabel)
        
//        let chineselabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        chineselabel.center = CGPoint(x: 180, y: 420)
//        chineselabel.textAlignment = .center
//        chineselabel.text = self.chineseDay[0]
//        view.addSubview(chineselabel)
//        
//        let eventlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
//        eventlabel.center = CGPoint(x: 180, y: 500)
//        eventlabel.textAlignment = .center
//        eventlabel.text = self.getEventDay()
//        eventlabel.numberOfLines = 0
//        view.addSubview(eventlabel)
//        
//        let screenSize = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        
//        let button1 = UIButton(frame: CGRect(x:0, y: 750, width: screenWidth, height: 50))
//        button1.backgroundColor = .green
//        button1.setTitle("pay for unlock", for: .normal)
//        button1.addTarget(self, action: #selector(buttonUnlockAction), for: .touchUpInside)
//        view.addSubview(button1)
        
        return view
    }
    @objc func buttonAction(sender: UIButton!) {
        performSegue(withIdentifier: "calendarView",sender: self)
    }
}
