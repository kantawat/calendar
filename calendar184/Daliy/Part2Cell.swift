
import UIKit

class Part2Cell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        label1.text = dayChiese.notlike1
        label2.text = dayChiese.notlike2
        label3.text = dayChiese.goodbad
        
        img1.image = UIImage(named: dayChiese.notlike1eng)
        img2.image = UIImage(named: dayChiese.notlike2eng)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
