//
//  CollectionViewCell.swift
//  iOSCoffeeTime
//
//  Created by 崎原邦達 on 2021/10/16.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var coffeeImageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setup(image: UIImage){
        self.coffeeImageCell.image = image
    }

}
