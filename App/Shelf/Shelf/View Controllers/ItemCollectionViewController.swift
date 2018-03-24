//
//  ItemCollectionViewController.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-14.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit

class ItemCollectionViewController: UICollectionViewController {
    
    var item_set = ["iPhone X", "PlayStation 4", "MacBook Pro 2017"]
    var image_set = ["iphoneX", "ps4", "mbp17"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Electronics"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item_set.count
    }
    
    // Set cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ItemCollectionCell", for: indexPath) as! ItemCollectionCell
        
        
        cell.layer.cornerRadius = 5.0
        //shadow
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        
        cell.itemName.text = " " + item_set[indexPath.row]
        cell.itemImage.image = UIImage(named: image_set[indexPath.row])
        cell.itemImage.contentMode = .scaleAspectFit
        
        return cell
    }
}
