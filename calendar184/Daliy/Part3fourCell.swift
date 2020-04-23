

import UIKit

//protocol Part3fourCellDelegate: class {
//    func  btnBegItem(select: String)
//}
class Part3fourCell: UITableViewCell {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    
    var name = [String]()
    var meaning = [String]()
    var listImg = [UIImageView]()
    
    weak var delegate: Part3CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        listImg = [img1,img2,img3,img4,img5,img6]
       
        for x in begList[3].details{
//            print(" \(x.name)")
            for u in x.list{
//                print(" \(u.name)")
                name.append(u.name)
                meaning.append(u.name)
            }
        }
        
        for (index, element) in listImg.enumerated() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapImage(_:)))
            element.tag = index
            element.isUserInteractionEnabled = true
            element.addGestureRecognizer(tapGesture)
        }

        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func tapImage(_ tap: UITapGestureRecognizer) {

    let getImage = tap.view as! UIImageView
      print("\(getImage.tag)")
        itemselectname = name[getImage.tag]
        itemselectmeaning = meaning[getImage.tag]
        delegate?.btnBegItem()

    }
    
}
