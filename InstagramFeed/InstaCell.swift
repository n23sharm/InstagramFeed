//
//  InstaCell.swift
//  InstagramFeed
//
//  Created by Neha Sharma on 5/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class InstaCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var instaImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
