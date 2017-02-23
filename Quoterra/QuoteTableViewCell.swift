//
//  QuoteTableViewCell.swift
//  Quoterra
//
//  Created by Song Chee Keat on 23/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit
import FaveButton

class QuoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var QuoteLabel: UILabel!
    @IBOutlet weak var QuoteAuthor: UILabel!
    @IBOutlet weak var QuoteTopic: UILabel!
    @IBOutlet var QuoteFaveStatus: FaveButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
