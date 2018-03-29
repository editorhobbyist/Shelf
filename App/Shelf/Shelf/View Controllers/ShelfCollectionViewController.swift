//
//  ShelfCollectionViewController.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-14.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import SwiftyJSON

class ShelfCollectionViewController: UICollectionViewController {
    
    var shelf_items = ["Electronics", "Jackets", "Shoes"]
    var shelf_images = ["mbp17", "jacket", "shoe"]
    
    var user: User? = nil
    let db_url = "https://weatherwears.000webhostapp.com/shelf/query.php"
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get User object from ShelfTabBarViewController
        let tabBarController = self.tabBarController as! ShelfTabBarViewController
        self.user = tabBarController.user
        
        // Set title
        self.navigationItem.title = "Shelves"
        
        self.navigationController?.navigationBar.shadowImage = UIImage()

        // Create and set search bar in Navigation Bar
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shelf_items.count
    }
    
    // Set cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ShelfCollectionCell", for: indexPath) as! ShelfCollectionCell
        
    
        cell.layer.cornerRadius = 5.0
        
        //shadow
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        
        cell.shelfName.text = " " + self.shelf_items[indexPath.row]
        cell.shelfImage.image = UIImage(named: self.shelf_images[indexPath.row])
        cell.shelfImage.contentMode = .scaleAspectFit
        return cell
    }
    
    // Loads user properties from server using a POST request - Returns [Shelf] object
    func loadShelves(completion: @escaping (_ result: User) -> Void) {
        let param: Parameters = [
            "queryType": "get_shelves",
            "user_id": self.user?.user_id ?? ""
        ]
        
        // TODO: Send a POST request using params from above
    }
}

