//
//  ReadingCell.swift
//  TableViewNavigation
//
//  Created by 晨韦 on 17/2/7.
//  Copyright © 2017年 晨韦. All rights reserved.
//

import UIKit

class ReadingCell: UITableViewCell {

    @IBOutlet var nameLab : UILabel!
    @IBOutlet var coverImg : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
