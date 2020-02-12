//
//  ContactCell.swift
//  Contacts
//
//  Created by Stephen Wall on 2/11/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var favoriteIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        removeStupidFuckingMargin()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func removeStupidFuckingMargin() {
        self.contentView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}
