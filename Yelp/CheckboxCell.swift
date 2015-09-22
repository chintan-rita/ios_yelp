//
//  CheckboxCell.swift
//  Yelp
//
//  Created by Chintan Rita on 9/21/15.
//  Copyright © 2015 Chintan Rita. All rights reserved.
//

import UIKit

class CheckboxCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
