//
//  ShelfTabBarViewController.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-26.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit

class ShelfTabBarViewController: UITabBarController {
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func setUser(_ user: User) {
        self.user = user
    }
}
