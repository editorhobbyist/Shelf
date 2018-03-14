//
//  ItemCollectionCell.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-14.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit

class ItemCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

