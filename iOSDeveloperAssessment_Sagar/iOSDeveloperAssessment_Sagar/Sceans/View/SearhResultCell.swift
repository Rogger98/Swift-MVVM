//
//  SearhResultCell.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

class SearhResultCell: UITableViewCell {

    @IBOutlet private weak var labelUserName: UILabel?
    @IBOutlet private weak var userImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var userDetails: Item? {
        didSet {
            labelUserName?.text = userDetails?.login?.stringValue
            if let imageUrl = userDetails?.avatarURL?.stringValue {
                userImageView?.loadImageFrom(url: imageUrl)
            }            
        }
    }
}
