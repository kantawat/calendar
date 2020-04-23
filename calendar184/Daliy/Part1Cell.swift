
import UIKit

protocol Part1CellDelegate: class {
    func  clickCalendar()
    func  clickMyNote()
}

class Part1Cell: UITableViewCell {

    @IBOutlet weak var fulldaylabel: UILabel!
    @IBOutlet weak var daylabel: UILabel!
    @IBOutlet weak var mothlabel: UILabel!
    @IBOutlet weak var yearlabel: UILabel!
    @IBOutlet weak var yearChinesslabel: UILabel!
    
    @IBOutlet weak var imgbg: UIImageView!
    
    weak var delegate: Part1CellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var imagepath = ""
        if(dayChiese.spacials.count > 0){
            imagepath = dayChiese.spacials[0].image
        }else if(dayChiese.goodbadtype == "good"){
            imagepath = "gooddaybg"
        }else{
            imagepath = "baddaybg"
        }
        imgbg.image = UIImage(named: imagepath)
       
        fulldaylabel.text = dayChiese.sub1dayStr
        daylabel.text = dayChiese.day
        mothlabel.text = dayChiese.month
        yearlabel.text = dayChiese.thaiyear
        yearChinesslabel.text = String(dayChiese.year.prefix(1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onBackCalendar(_ sender: UIButton) {
        delegate?.clickCalendar()
    }
    
    @IBAction func onGoMyNote(_ sender: UIButton) {
        delegate?.clickMyNote()
    }
}

