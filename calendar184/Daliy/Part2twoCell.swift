//
//  Part2twoCell.swift
//  calendar184
//
//  Created by Yuan Kan on 22/4/20.
//  Copyright © 2020 kantawat. All rights reserved.
//

import UIKit

protocol Part2twoCellDelegate: class {
    func MyCell(select: String)
}

class Part2twoCell: UITableViewCell {
    
 weak var delegate: Part2twoCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onClickbtn1(_ sender: UIButton) {
        delegate?.MyCell(select: "11")
    }
    
}
