//
//  ShelfCollectionViewController.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-14.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit
import Firebase

class ShelfCollectionViewController: UICollectionViewController {
    
    var shelf_items = ["Electronics", "Jackets", "Shoes"]
    var shelf_images = ["mbp17", "jacket", "shoe"]
    var fb_shelf_items: [String: AnyObject] = [:]
    var fb_shelf_items_array: [String] = []
    
    var ref = Database.database().reference() // Reference to RealtimeFirebaseDatabase
    let user = Auth.auth().currentUser
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Shelves"
        
        ref.child("shelves").child((self.user?.uid)!).observe(.value, with: { (snapshot) in
            self.fb_shelf_items = (snapshot.value as? [String: AnyObject])!
            self.fb_shelf_items_array = self.fb_shelf_items.map{return $0.key}
            self.collectionView?.reloadData()
        })

        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fb_shelf_items.count
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
        
        cell.shelfName.text = " " + self.fb_shelf_items_array[indexPath.row]
        //cell.shelfImage.contentMode = .scaleAspectFit
        return cell
    }
}

