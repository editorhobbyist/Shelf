//
//  Item.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-28.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import Foundation
import UIKit

class Item {
    var shelf_id: String = ""
    var user_id: String = ""
    var name: String = ""
    var price: String = ""
    var tag: String = ""
    var note: String = ""
    
    var receipt_img: UIImage? = nil
    var warranty_img: UIImage? = nil
    var product_img: UIImage? = nil
    
    var return_date: String = ""
    var purchase_date: String = ""
    var insert_date: String = ""
    
    var location_long: String = ""
    var location_lat: String = ""
    var location_desc: String = ""

    
    public init(_ shelfID: String,
                _ userID: String,
                _ itemName: String,
                _ priceField: String,
                _ tagField: String,
                _ noteField: String,
                _ receiptImg: UIImage,
                _ warrantyImg: UIImage,
                _ productImg: UIImage,
                _ returnDate: String,
                _ purchaseDate: String,
                _ insertDate: String,
                _ locationLong: String,
                _ locationLat: String,
                _ locationDesc: String
        ) {
            self.shelf_id = shelfID
            self.user_id = userID
            self.name = itemName
            self.price = priceField
            self.tag = tagField
            self.note = noteField
            self.receipt_img = receiptImg
            self.warranty_img = warrantyImg
            self.product_img = productImg
            self.return_date = returnDate
            self.purchase_date = purchaseDate
            self.insert_date = insertDate
            self.location_long = locationLong
            self.location_lat = locationLat
            self.location_desc = locationDesc
    }
}

