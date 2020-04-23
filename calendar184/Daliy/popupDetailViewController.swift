

import UIKit

class popupDetailViewController: UIViewController {

    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var labelmeaning: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelname.text = itemselectname
        labelmeaning.text = itemselectmeaning
        
        img.image = UIImage(named: itemselectname)
    }
    
    @IBAction func onClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onMap(_ sender: Any) {
        //popuptomap
        searchMap = itemselectname
        self.performSegue(withIdentifier: "popuptomap",sender: self)
    }
}
