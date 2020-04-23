
import UIKit

protocol Part2twoCellDelegate: class {
    func  btnBeg(select: Int)
}

class Part2twoCell: UITableViewCell {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    var canUseBtn = [false,false,false,false]
    var clickBtn = -1
    
    var listBtn = [UIButton]()
    
    weak var delegate: Part2twoCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label1.text = dayChiese.notlike1
        label2.text = dayChiese.notlike2
        label3.text = dayChiese.goodbad
        
        img1.image = UIImage(named: dayChiese.notlike1eng)
        img2.image = UIImage(named: dayChiese.notlike2eng)
       
        listBtn = [btn1,btn2,btn3,btn4]
        var isFirst = true
        for x in dayChiese.arrbeg{
            canUseBtn[x] = true
            setBtncanActive(listBtn[x])
            if(isFirst){
                isFirst=false
                switch x {
                case 0:
                    setBtnActive(btn1)
                case 1:
                  setBtnActive(btn2)
                case 2:
                    setBtnActive(btn3)
                default:
                    setBtnActive(btn4)
                }
            }
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func onClickbtn1(_ sender: UIButton) {
        if(canUseBtn[0]){
            setBtnActive(sender)
            setBtnUnactive(0)
            delegate?.btnBeg(select: 1)
        }
    }
    
    @IBAction func onClickbtn2(_ sender: UIButton) {
         if(canUseBtn[1]){
               setBtnActive(sender)
               setBtnUnactive(1)
               delegate?.btnBeg(select: 2)
           }
    }
    @IBAction func onClickbtn3(_ sender: UIButton) {
         if(canUseBtn[2]){
               setBtnActive(sender)
               setBtnUnactive(2)
               delegate?.btnBeg(select: 3)
           }
    }
    @IBAction func onClickbtn4(_ sender: UIButton) {
         if(canUseBtn[3]){
               setBtnActive(sender)
               setBtnUnactive(3)
               delegate?.btnBeg(select: 4)
           }
    }
    
    func setBtnActive(_ sender: UIButton) {
        sender.setImage(UIImage(named: "btnactive"), for: .normal)
    }
    func setBtncanActive(_ sender: UIButton) {
           sender.setImage(UIImage(named: "btnunactive"), for: .normal)
       }
    
    func setBtnUnactive(_ active:Int) {
        
        for (i, x) in canUseBtn.enumerated() {
            if(x && i != active){
                let image = UIImage(named: "btnunactive")
                listBtn[i].setImage(image, for: .normal)
            }
        }

        
    }
    
}
