//
//  HomeVideoCell.swift
//  KTV
//
//  Created by 정채연 on 3/11/24.
//

import UIKit

class HomeVideoCell: UICollectionViewCell {
    
    static let identifier: String = "HomeVideoCell"
    static let height: CGFloat = 320
   
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelSubTitleLabel: UILabel!
    @IBOutlet weak var channelTitleLabel: UILabel!
    
    @IBOutlet weak var hotImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
   
    //awakeFromNib은 class와 ui가 링크되는 타이밍이다.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        self.containerView.layer.borderWidth = 1
        self.clipsToBounds = true
        
    }
    
}
