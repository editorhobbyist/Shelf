//
//  Shelf.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-28.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import Foundation
import UIKit

class Shelf {
    var shelf_id: String = ""
    var user_id: String = ""
    var name: String = ""
    var picture: UIImage? = nil
    
    public init(_ shelfID: String, _ userID: String, _ shelfName: String, _ uiPicture: UIImage) {
        self.shelf_id = shelfID
        self.user_id = userID
        self.name = shelfName
        self.picture = uiPicture
    }
}
