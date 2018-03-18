//
//  ShelfCollectionViewController.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-14.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit

class ShelfCollectionViewController: UICollectionViewController {
    
    var shelf_items = ["Electronics", "Jackets", "Shoes"]
    var shelf_images = ["mbp17", "jacket", "shoe"]
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController!.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Shelves"
        
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        
        collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shelf_items.count
    }
    
    // Set cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ShelfCollectionCell", for: indexPath) as! ShelfCollectionCell
        
        //shadow
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        
        cell.shelfName.text = " " + shelf_items[indexPath.row]
        cell.shelfImage.image = UIImage(named: shelf_images[indexPath.row])
        cell.shelfImage.contentMode = .scaleAspectFit

        return cell
    }
}

