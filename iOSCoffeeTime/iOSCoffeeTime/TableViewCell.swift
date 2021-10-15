//
//  TableViewCell.swift
//  iOSCoffeeTime
//
//  Created by 崎原邦達 on 2021/10/15.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var coffeeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(titleText: String, detailText: String, image: UIImage){
        self.titleLabel.text = titleText
        self.detailLabel.text = detailText
        self.coffeeImage.image = image
    }
}
