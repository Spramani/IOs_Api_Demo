//
//  tableviewTableViewCell.swift
//  api_Demo
//
//  Created by MAC on 29/10/20.
//

import UIKit

class tableviewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
