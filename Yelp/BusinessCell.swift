//
//  BusinessCell.swift
//  Yelp
//
//  Created by Chintan Rita on 9/21/15.
//  Copyright © 2015 Chintan Rita. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var reviewsCountLabel: UILabel!
    
    @IBOutlet weak var categoriesLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    
    @IBOutlet weak var ratingsImageView: UIImageView!
    
    var business: Business! {
        didSet{
            self.thumbImageView.setImageWithURL(business.imageURL!)
            self.nameLabel.text = business.name!
            self.distanceLabel.text = business.distance!
            self.reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
            self.categoriesLabel.text = business.categories!
            self.addressLabel.text = business.address!
            self.ratingsImageView.setImageWithURL(business.ratingImageURL!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
        // Initialization code
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
