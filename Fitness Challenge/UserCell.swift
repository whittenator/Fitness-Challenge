//
//  UserCell.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/20/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    @IBOutlet weak var firstNameLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
