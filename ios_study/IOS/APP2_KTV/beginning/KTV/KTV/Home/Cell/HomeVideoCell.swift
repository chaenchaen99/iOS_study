//
//  HomeVideoCell.swift
//  KTV
//
//  Created by 정채연 on 3/11/24.
//

import UIKit

class HomeVideoCell: UITableViewCell {
   
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelSubTitleLabel: UILabel!
    @IBOutlet weak var channelTitleLabel: UILabel!
    
    @IBOutlet weak var hotImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
