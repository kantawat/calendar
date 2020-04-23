

import UIKit

//protocol Part3threeCellDelegate: class {
//    func  btnBegItem(select: String)
//}
class Part3threeCell: UITableViewCell {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var img10: UIImageView!
    @IBOutlet weak var img11: UIImageView!
    @IBOutlet weak var img12: UIImageView!
    @IBOutlet weak var img13: UIImageView!
    @IBOutlet weak var img14: UIImageView!
    @IBOutlet weak var img15: UIImageView!
    @IBOutlet weak var img16: UIImageView!
    @IBOutlet weak var img17: UIImageView!
    @IBOutlet weak var img18: UIImageView!
    @IBOutlet weak var img19: UIImageView!
    @IBOutlet weak var img20: UIImageView!
    
    var name = [String]()
    var meaning = [String]()
    var listImg = [UIImageView]()
    
    weak var delegate: Part3CellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
            listImg = [img1,img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16,img17,img18,img19,img20,]
               
                for x in begList[2].details{
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
